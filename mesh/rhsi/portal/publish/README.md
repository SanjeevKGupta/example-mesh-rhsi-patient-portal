
### Portal 

Project has three major components that will be deployed in two different namespaces.
1. [`UI` deployed in frontend](#1-deploy-ui-frontend)
2. [`database` deployed in backend](#2-deploy-database-backend)
3. [`processor` deployed in backend](#3-deploy-processor-backend)

### To build, publish and deploy each component 
See `Makefile` for details. Requires several ENV variables that must be setup for customization and automation.

- Must log into the cluster - `ROKS` or `IKS`
- As an argument to `make` provide **cluster context**. A renamed cluster context is good.
- Provide NAMESPACE_PREFIX. `-front` will be appended for the frontend service and `-back` for the backend service.

#### 1. Deploy `UI` frontend
Will append `-front` in the NAMESPACE_PREFIX
```
Example:

make ui CLUSTER=kc-iks-dc NAMESPACE_PREFIX=sn-demo-po-prod-mc-iks-dc
```
#### 2. Deploy `database` backend
Will append `-back` in the NAMESPACE_PREFIX
```
make database CLUSTER=kc-iks-dc NAMESPACE_PREFIX=sn-demo-po-prod-mc-iks-dc
```
#### 3. Deploy `processor` backend
Will append `-back` in the NAMESPACE_PREFIX
```
make processor CLUSTER=kc-iks-dc NAMESPACE_PREFIX=sn-demo-po-prod-mc-iks-dc
```
