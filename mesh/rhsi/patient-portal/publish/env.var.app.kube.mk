env_var_setup = $(if $($1),,$(error $1 is not set. $2, e.g. export $1=$3))

$(call env_var_setup,K_PP_NAME_FRONT,Set deployment and pod name prefix,<sg-pp-frontend>)
$(call env_var_setup,K_PP_LABEL_APP_FRONT,Set label for the selector,<sg-pp-frontend>)
$(call env_var_setup,K_PP_REPLICAS_FRONT,Set number of pod relicas,<3>)
$(call env_var_setup,K_PP_IMAGE_NAME_FRONT,Set image name for the deployment,<sg-pp-image-frontend>)
$(call env_var_setup,K_PP_IMAGE_PULL_SECRET_NAME_FRONT,Set image pull secret name from container registry,<sg-pp-mesh-poc-image-pull-front-sec>)

$(call env_var_setup,K_PP_SERVICE_HOST_DB_BACK,Set database service host,<database>)
$(call env_var_setup,K_PP_SERVICE_PORT_DB_BACK,Set database service port,<5432>)
$(call env_var_setup,K_PP_SERVICE_HOST_PP_BACK,Set payment processor host,<payment-processor>)
$(call env_var_setup,K_PP_SERVICE_PORT_PP_BACK,Set payment processor host,<8080>)
$(call env_var_setup,K_PP_CONTAINER_PORT_FRONT,Set payment processor host,<8080>)

$(call env_var_setup,K_PP_NAME_DB_BACK,Set deployment and pod name prefix,<sg-pp-db-back>)
$(call env_var_setup,K_PP_LABEL_APP_DB_BACK,Set label for the selector,<sg-pp-db-back>)
$(call env_var_setup,K_PP_REPLICAS_DB_BACK,Set number of pod relicas,<1>)
$(call env_var_setup,K_PP_IMAGE_NAME_DB_BACK,Set image name for the deployment,<sg-pp-image-db-back>)
$(call env_var_setup,K_PP_IMAGE_PULL_SECRET_NAME_DB_BACK,Set image pull secret name from container registry,<sg-pp-mesh-poc-image-pull-db-back-sec>)

$(call env_var_setup,K_PP_NAME_PP_BACK,Set deployment and pod name prefix,<sg-pp-pp-back>)
$(call env_var_setup,K_PP_LABEL_APP_PP_BACK,Set label for the selector,<sg-pp-pp-back>)
$(call env_var_setup,K_PP_REPLICAS_PP_BACK,Set number of pod relicas,<3>)
$(call env_var_setup,K_PP_IMAGE_NAME_PP_BACK,Set image name for the deployment,<sg-pp-image-pp-back>)
$(call env_var_setup,K_PP_IMAGE_PULL_SECRET_NAME_PP_BACK,Set image pull secret name from container registry,<sg-pp-mesh-poc-image-pull-pp-back-sec>)



