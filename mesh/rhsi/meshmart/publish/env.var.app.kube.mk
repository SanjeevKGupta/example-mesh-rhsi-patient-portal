env_var_setup = $(if $($1),,$(error $1 is not set. $2, e.g. export $1=$3))

$(call env_var_setup,K_MM_NAME_UI_FRONT,Set deployment and pod name prefix,<sg-mm-frontend>)
$(call env_var_setup,K_MM_LABEL_APP_UI_FRONT,Set label for the selector,<sg-mm-frontend>)
$(call env_var_setup,K_MM_REPLICAS_UI_FRONT,Set number of pod relicas,<3>)
$(call env_var_setup,K_MM_IMAGE_NAME_UI_FRONT,Set image name for the deployment,<sg-mm-image-ui-frontend>)
$(call env_var_setup,K_MM_IMAGE_PULL_SECRET_UI_FRONT,Set image pull secret from container registry,<sg-mm-image-pull-sec-ui-front>)

$(call env_var_setup,K_MM_SERVICE_HOST_DB_BACK,Set database service host,<sg-mm-database>)
$(call env_var_setup,K_MM_SERVICE_PORT_DB_BACK,Set database service port,<5432>)
$(call env_var_setup,K_MM_SERVICE_HOST_PP_BACK,Set payment processor host,<sg-mm-payment-processor>)
$(call env_var_setup,K_MM_SERVICE_PORT_PP_BACK,Set payment processor host,<8080>)
$(call env_var_setup,K_MM_CONTAINER_PORT_FRONT,Set payment processor host,<8080>)

$(call env_var_setup,K_MM_NAME_DB_BACK,Set deployment and pod name prefix,<sg-mm-db>)
$(call env_var_setup,K_MM_LABEL_APP_DB_BACK,Set label for the selector,<sg-mm-db>)
$(call env_var_setup,K_MM_REPLICAS_DB_BACK,Set number of pod relicas,<1>)
$(call env_var_setup,K_MM_IMAGE_NAME_DB_BACK,Set image name for the deployment,<sg-mm-image-db-back>)
$(call env_var_setup,K_MM_IMAGE_PULL_SECRET_DB_BACK,Set image pull secret name from container registry,<sg-mm-image-pull-sec-db-back>)

$(call env_var_setup,K_MM_NAME_PP_BACK,Set deployment and pod name prefix,<sg-mm-pp>)
$(call env_var_setup,K_MM_LABEL_APP_PP_BACK,Set label for the selector,<sg-pp-pp>)
$(call env_var_setup,K_MM_REPLICAS_PP_BACK,Set number of pod relicas,<1>)
$(call env_var_setup,K_MM_IMAGE_NAME_PP_BACK,Set image name for the deployment,<sg-mm-image-pp-back>)
$(call env_var_setup,K_MM_IMAGE_PULL_SECRET_PP_BACK,Set image pull secret name from container registry,<sg-mm-image-pull-sec-pp-back>)

