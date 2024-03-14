
-include env.var.app.cmd.mk

# all: deploy-frontend-execute

ui: verify-ui-kube-yaml deploy-ui-execute
database: verify-database-kube-yaml deploy-database-execute
processor: verify-processor-kube-yaml deploy-processor-execute

check_yn:
	@echo "\n\nDeploy \033[0mon CLUSTER: \033[1;30m${CLUSTER} \033[0min NAMESPACE_PREFIX: \033[1;30m${NAMESPACE_PREFIX}\033[0m using above \033[1;30myaml \033[0m"
	@echo "\033[1;30mOK to proceed? \033[0m[y/N] " && read ans && if [ $${ans:-'N'} = 'y' ]; then ans=""; echo "Proceeding..."; else exit 1; fi

check_var_cluster:
	$(call cmd_var_check,CLUSTER,as make <target> CLUSTER=<cluster-context>)
	@echo ""
	@echo "\033[1;30mSwitching to cluster ${CLUSTER} \033[0m"
	@echo "Cluster: ${CLUSTER}"

check_var_namespace:
	$(call cmd_var_check,NAMESPACE_PREFIX,as make <target> NAMESPACE_PREFIX=<namespace_prefix>)
	@echo ""
	@echo "\033[1;30mChecking namespace_prefix ${NAMESPACE_PREFIX} \033[0m"
	@echo "NAMESPACE_PREFIX: ${NAMESPACE_PREFIX}"

switch-cluster: check_var_cluster check_var_namespace
	kubectl config use-context ${CLUSTER};kubectl get nodes
	@echo ""	

verify-ui-kube-yaml: switch-cluster
	@echo "\033[1;30mGenerating deployment yaml...\033[0m"
	make -C src/frontend test_kube_envsubst

deploy-ui-execute: verify-ui-kube-yaml check_yn 
	@echo ""
	@echo "\033[1;30mBuild, push and kube deploy...\033[0m"
	make -C src/frontend build 
	make -C src/frontend push
	make -C src/frontend apply_kube NAMESPACE=${NAMESPACE_PREFIX}-fronr

verify-database-kube-yaml: switch-cluster
	@echo "\033[1;30mGenerating deployment yaml...\033[0m"
	make -C src/database test_kube_envsubst

deploy-database-execute: verify-database-kube-yaml check_yn
	@echo ""
	@echo "\033[1;30mBuild, push and kube deploy...\033[0m"
	make -C src/database build 
	make -C src/database push
	make -C src/database apply_kube NAMESPACE=${NAMESPACE_PREFIX}-back

verify-processor-kube-yaml: switch-cluster
	@echo "\033[1;30mGenerating deployment yaml...\033[0m"
	make -C src/payment-processor test_kube_envsubst

deploy-processor-execute: verify-processor-kube-yaml check_yn
	@echo ""
	@echo "\033[1;30mBuild, push and kube deploy...\033[0m"
	make -C src/payment-processor build 
	make -C src/payment-processor push
	make -C src/payment-processor apply_kube NAMESPACE=${NAMESPACE_PREFIX}-back
