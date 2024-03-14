env_var_setup = $(if $($1),,$(error $1 is not set. $2, e.g. export $1=$3))

$(call env_var_setup,K_PO_NAME_UI_FRONT,Set deployment and pod name prefix,<ui>)
$(call env_var_setup,K_PO_LABEL_APP_UI_FRONT,Set label for the selector,<ui>)
$(call env_var_setup,K_PO_REPLICAS_UI_FRONT,Set number of pod relicas,<3>)
$(call env_var_setup,K_PO_IMAGE_NAME_UI_FRONT,Set image name for the deployment,<ui-image>)
$(call env_var_setup,K_PO_IMAGE_PULL_SECRET_UI_FRONT,Set image pull secret from container registry,<ui-image-pull-sec>)

$(call env_var_setup,K_PO_SERVICE_HOST_DB_BACK,Set database service host,<database>)
$(call env_var_setup,K_PO_SERVICE_PORT_DB_BACK,Set database service port,<5432>)
$(call env_var_setup,K_PO_SERVICE_HOST_PP_BACK,Set payment processor host,<processor>)
$(call env_var_setup,K_PO_SERVICE_PORT_PP_BACK,Set payment processor host,<8080>)
$(call env_var_setup,K_PO_CONTAINER_PORT_FRONT,Set payment processor host,<8080>)

$(call env_var_setup,K_PO_NAME_DB_BACK,Set deployment and pod name prefix,<database>)
$(call env_var_setup,K_PO_LABEL_APP_DB_BACK,Set label for the selector,<database>)
$(call env_var_setup,K_PO_REPLICAS_DB_BACK,Set number of pod relicas,<1>)
$(call env_var_setup,K_PO_IMAGE_NAME_DB_BACK,Set image name for the deployment,<database-image>)
$(call env_var_setup,K_PO_IMAGE_PULL_SECRET_DB_BACK,Set image pull secret name from container registry,<database-image-pull-sec>)

$(call env_var_setup,K_PO_NAME_PP_BACK,Set deployment and pod name prefix,<processor>)
$(call env_var_setup,K_PO_LABEL_APP_PP_BACK,Set label for the selector,<processor>)
$(call env_var_setup,K_PO_REPLICAS_PP_BACK,Set number of pod relicas,<1>)
$(call env_var_setup,K_PO_IMAGE_NAME_PP_BACK,Set image name for the deployment,<processor-image>)
$(call env_var_setup,K_PO_IMAGE_PULL_SECRET_PP_BACK,Set image pull secret name from container registry,<processor-image-pull-sec>)

