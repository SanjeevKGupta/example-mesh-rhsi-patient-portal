## IBM Hybrid Cloud Mesh - Meshmart - A repurposed custom example

This leverages skupperproject Patient Portal example. 
1. [Setup ENVIRONMENT variables](#1-setup-environment-variables) 
2. [Build, push and deploy application](#2-build-push-and-deploy-application)

In this Meshmart example the process to build, push and deploy the k8s example has been significantly auotomated. Distinct steps are:
- Build the docker images with identifiable names across project team members
- Push the images into your container registry
- Deploy the application in your cluster namespace  

To acconlish steps for the frontend, database and simulated payment-processor images, define following ENV variables in your shell. 
Using ENV vars removes hard-coded values and provides full flexiblity to customize. 
You may store these ENVs in files and `source` them. Yoy may keep them in seperate files or one file, your choice.

### 1. Setup ENVIRONMENT variables 
#### ENV image build
ENVs involved in naming the image name and pushing them into CR

**File:** env-app-image-build
```
# An arbitrary value to organize your image name . 
export EDGE_OWNER=<sg.cedge>
# An arbitrary value to organize your image name
export EDGE_DEPLOY=<ex.mesh.rhsi.meshmart>

# The architecture of the worker nodes
export ARCH=amd64

### Authenticated container registry (CR) access. This example uses IBM CR. Your values may be different. ###
export CR_HOST=<cr-host-domain-name>
export CR_HOST_USERNAME=<cr-your-username>
export CR_HOST_NAMESPACE=<cr-your-namespace>
export CR_APP_API_KEY_RO_PULL=<cr-read-only-pull-api-key>
export CR_APP_API_KEY_RW_PUSH=<cr-read-write-push-api-key>
##################################
```
#### ENV open horizon
The Hybrid Cloud Mesh - RHSI implementation uses open-horizon (an OSS) to deploy RHSI (skupper) pods. Following ENVs relate with that and needs to be obtained from `agent-install.cfg` file after agent is installed

**File:** env-app-hzn
```
export HZN_ORG_ID=<hzn-org-id>
export HZN_EXCHANGE_USER_AUTH="ohuser:<api-key>"
```
#### ENV application specific
NAMESPACE is set as an argument while building, pushing and deploying the app. `make <target> NAMESPACE=<namespace>`

**File:** env-app-kube-deploy
```
# An identifiable name of the frontend service. Arbitrary.
export K_MN_NAME_UI_FRONT=<sg-meshmart-frontend>
# Same name as above. Used by the k8s selector
export K_MM_LABEL_APP_UI_FRONT=<sg-meshmart-frontend>
# frontend pod relica count. 3
export K_MM_REPLICAS_UI_FRONT=3
# An identifiable image name, Arbitrary.
export K_MM_IMAGE_NAME_UI_FRONT=<sg-mm-image-ui-frontend>
# An identifiable name., Arbitrary
export K_MM_IMAGE_PULL_SECRET_UI_FRONT=<sg-mm-image-pull-sec-ui-front>

# Database service host
export K_MM_SERVICE_HOST_DB_BACK=<sg-mm-database>
# Database service port
export K_MM_SERVICE_PORT_DB_BACK=5432
# Payment-processor service host
export K_MM_SERVICE_HOST_PP_BACK=<sg-mm-payment-processor>
# Payment-processor service port
export K_MM_SERVICE_PORT_PP_BACK=8080
# Frontend service port
export K_MM_CONTAINER_PORT_FRONT=8080

# Database service name
export K_MM_NAME_DB_BACK=<sg-mm-database>
# Database service label name. Same as above
export K_MM_LABEL_APP_DB_BACK=<sg-mm-database>
# Database pod relica count. 1
export K_MM_REPLICAS_DB_BACK=1
# An identifiable image name, Arbitrary.
export K_MM_IMAGE_NAME_DB_BACK=<sg-mm-image-db-back>
# An identifiable name., Arbitrary
export K_MM_IMAGE_PULL_SECRET_DB_BACK=<sg-mm-image-pull-sec-db-back>

# Payment-processor service name
export K_MM_NAME_PP_BACK=<sg-mm-payment-processor>
# Payment-processor service label name. Same as above
export K_MM_LABEL_APP_PP_BACK=<sg-mm-payment-processor>
# Payment-processor pod relica count. 1
export K_MM_REPLICAS_PP_BACK=1
# An identifiable image name, Arbitrary.
export K_MM_IMAGE_NAME_PP_BACK=<sg-mm-image-pp-back>
# An identifiable name., Arbitrary
export K_MM_IMAGE_PULL_SECRET_PP_BACK=<sg-mm-image-pull-sec-pp-back>

```
### 2. Build, push and deploy application 
make` command builds the images, pushes into contaienr registry and deploys the application into the NAMESPACE as specified.
```
make -C src/database NAMESPACE=<backend-namespace-to-deploy-application-in>
make -C src/payment-processor NAMESPACE=<backend-namespace-to-deploy-application-in>
make -C src/frontend NAMESPACE=<frontend-namespace-to-deploy-application-in>
```

### Reference:
https://www.ibm.com/docs/en/hybrid-cloud-mesh?topic=previews-working-red-hat-service-interconnect
