## IBM Hybrid Cloud Mesh - `Portal` - A repurposed custom example

This leverages skupperproject Patient Portal example.

In this example the process to build, push and deploy the k8s example has been significantly auotomated. Distinct steps are:
- Build the docker images with identifiable names
- Push the images into your container registry
- Deploy the application in your cluster namespace  

To acconlish steps for the frontend, database and simulated payment-processor images, define ENVIRONMENT variables in your shell. Using ENVIRONMENT vars removes hard-coded values and provides full flexiblity to customize. You may store these ENVs in files and `source` them. Yoy may keep them in seperate files or one file, your choice.

Project has three major components that will be deployed in two different namespaces.
1. [Setup ENVIRONMENT variables](#1-setup-environment-variables)
2. [Build, push and deploy application components](#2build-publish-and-deploy-application-components)
3. [Deploy `UI` in frontend](#3-deploy-ui-frontend)
4. [Deploy `database` in backend](#4-deploy-database-backend)
5. [Deploy `processor` in backend](#5-deploy-processor-backend)

### 1. Setup ENVIRONMENT variables
#### ENV image build
ENVs involved in naming the image name and pushing them into CR

**File:** env-app-image-build
```
# An arbitrary value to organize your image name . 
export EDGE_OWNER=<sg.cedge>
# An arbitrary value to organize your image name
export EDGE_DEPLOY=<ex.mesh.rhsi.portal>

# Used by kube resources as prefix when creating different names, lables etc. Customize as per your needs.
export EDGE_RESOURCE_PREFIX=<sn-demo-po>

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
CLUSTER and NAMESPACE are set as an argument while building, pushing and deploying the app. 
`make <target> CLUSTER=<cluster-context> NAMESPACE_PREFIX=<your-namespace-prefix>`
```
# An identifiable name of the frontend service. Arbitrary.
export K_PO_NAME_UI_FRONT=ui
# Same name as above. Used by the k8s selector
export K_PO_LABEL_APP_UI_FRONT=ui
# frontend pod relica count. 1
export K_PO_REPLICAS_UI_FRONT=1
# An identifiable image name, Arbitrary.
export K_PO_IMAGE_NAME_UI_FRONT=ui-image
export K_PO_IMAGE_PULL_SECRET_UI_FRONT=ui-image-pull-sec

export K_PO_SERVICE_HOST_DB_BACK=database
export K_PO_SERVICE_PORT_DB_BACK=5432
export K_PO_SERVICE_HOST_PP_BACK=processor
export K_PO_SERVICE_PORT_PP_BACK=8080
export K_PO_CONTAINER_PORT_FRONT=8080

export K_PO_NAME_DB_BACK=database
export K_PO_LABEL_APP_DB_BACK=database
export K_PO_REPLICAS_DB_BACK=1
export K_PO_IMAGE_NAME_DB_BACK=database-image
export K_PO_IMAGE_PULL_SECRET_DB_BACK=database-image-pull-sec

export K_PO_NAME_PP_BACK=processor
export K_PO_LABEL_APP_PP_BACK=processor
export K_PO_REPLICAS_PP_BACK=3
export K_PO_IMAGE_NAME_PP_BACK=processor-image
export K_PO_IMAGE_PULL_SECRET_PP_BACK=processor-image-pull-sec
```
### 2.Build, publish and deploy application components
See `Makefile` for details. 
- Must log into the cluster - `ROKS` or `IKS`
- As an argument to `make` provide **cluster context**. A renamed cluster context is good.
- Provide NAMESPACE_PREFIX. `-front` will be appended for the frontend service and `-back` for the backend service.

### 3. Deploy `UI` frontend
Will append `-front` with NAMESPACE_PREFIX
```
Example:

make ui CLUSTER=kc-iks-dc NAMESPACE_PREFIX=sn-demo-po-prod-mc-iks-dc
```
### 4. Deploy `database` backend
Will append `-back` with NAMESPACE_PREFIX
```
Example:

make database CLUSTER=kc-iks-dc NAMESPACE_PREFIX=sn-demo-po-prod-mc-iks-dc
```
### 5. Deploy `processor` backend
Will append `-back` with NAMESPACE_PREFIX
```
Example:

make processor CLUSTER=kc-iks-dc NAMESPACE_PREFIX=sn-demo-po-prod-mc-iks-dc
```
