env_var_setup = $(if $($1),,$(error $1 is not set. $2, e.g. export $1=$3))

$(call env_var_setup,K_PP_NAME_UI_FRONT,Set deployment and pod name prefix,<sg-pp-frontend>)
$(call env_var_setup,K_PP_LABEL_APP_UI_FRONT,Set label for the selector,<sg-pp-frontend>)
$(call env_var_setup,K_PP_REPLICAS_UI_FRONT,Set number of pod relicas,<3>)
$(call env_var_setup,K_PP_IMAGE_UI_FRONT,Set image name for the deployment,<sg-pp-image-frontend>)
$(call env_var_setup,K_PP_IMAGE_PULL_SECRET_UI_FRONT,Set image pull secret name from container registry,<sg-pp-mesh-poc-image-pull-front-sec>)

$(call env_var_setup,K_PP_SERVICE_HOST_DB_BACK,Set database service host,<database>)
$(call env_var_setup,K_PP_SERVICE_PORT_DB_BACK,Set database service port,<5432>)
$(call env_var_setup,K_PP_SERVICE_HOST_PROC_BACK,Set payment processor host,<payment-processor>)
$(call env_var_setup,K_PP_SERVICE_PORT_PROC_BACK,Set payment processor host,<8080>)
$(call env_var_setup,K_PP_CONTAINER_PORT_UI_FRONT,Set payment processor host,<8080>)

$(call env_var_setup,K_PP_NAME_DB_BACK,Set deployment and pod name prefix,<sg-pp-db-back>)
$(call env_var_setup,K_PP_LABEL_APP_DB_BACK,Set label for the selector,<sg-pp-db-back>)
$(call env_var_setup,K_PP_REPLICAS_DB_BACK,Set number of pod relicas,<1>)
$(call env_var_setup,K_PP_IMAGE_DB_BACK,Set image name for the deployment,<sg-pp-image-db-back>)
$(call env_var_setup,K_PP_IMAGE_PULL_SECRET_DB_BACK,Set image pull secret name from container registry,<sg-pp-mesh-poc-image-pull-db-back-sec>)

$(call env_var_setup,K_PP_NAME_PROC_BACK,Set deployment and pod name prefix,<sg-pp-pp-back>)
$(call env_var_setup,K_PP_LABEL_APP_PROC_BACK,Set label for the selector,<sg-pp-pp-back>)
$(call env_var_setup,K_PP_REPLICAS_PROC_BACK,Set number of pod relicas,<3>)
$(call env_var_setup,K_PP_IMAGE_PROC_BACK,Set image name for the deployment,<sg-pp-image-pp-back>)
$(call env_var_setup,K_PP_IMAGE_PULL_SECRET_PROC_BACK,Set image pull secret name from container registry,<sg-pp-mesh-poc-image-pull-pp-back-sec>)



