//
// Licensed to the Apache Software Foundation (ASF) under one
// or more contributor license agreements.  See the NOTICE file
// distributed with this work for additional information
// regarding copyright ownership.  The ASF licenses this file
// to you under the Apache License, Version 2.0 (the
// "License"); you may not use this file except in compliance
// with the License.  You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.
//

import * as gesso from "./gesso/main.js";
import * as main from "./main.js";

const html = `
<body class="excursion login">
  <section>
    <div>
      <div class="logo"></div>
      <div class="headline">Patient Portal</div>
      <div style="font-size: 16px;text-align: right;"><span style="background-color: #3ddbd9;">&nbsp;Hybrid Cloud Mesh - RHSI&nbsp;</span></div>
      <hr>
      <div class="hflex">
        <div>
          <p>Patient Portal is a simple example application where public frontend is accessing private network resources using Mesh RHSI gateways.</p>
          <div>It showcases three interacting services:</div>
          <div>- A web frontend</div>
          <div>- A relational database</div>
          <div>- A simulated payment-processor</div>
        </div>
        <div>
          <div><img src="/static/pp.png" width="285" height="158"></div>
        </div>
      </div>

      <p>Patients can request appointments and pay bills.  Doctors can
      confirm appointments and bill patients. Access as a patient or
      doctor to try it out.</p>

      <div class="hflex">
        <div>
          <h2>Patient access:</h2>

          <nav id="patient-login-links"></nav>
        </div>

        <div>
          <h2>Doctor access:</h2>

          <nav id="doctor-login-links"></nav>
        </div>
      </div>
      <hr>
      <div style="width:100%; overflow:hidden;">
        <div style="width:80%; float:left;">
          <span id="env-hostname"></span><br>
          <span id="env-db_service_host"></span>
        </div>
        <div style="width:20%; float:right;">
          <span style="text-align:right;" id="current-date"></span><br>
          <span style="text-align:right;" id="current-time"></span>
        </div>
      </div>
    </div>
  </section>
</body>
`;

function updatePatientLoginLinks(data) {
    const nav = gesso.createNav(null, "#patient-login-links");

    for (const item of Object.values(data.patients)) {
        gesso.createLink(nav, `/patient?id=${item.id}`, item.name);
    }

    $("#patient-login-links").replaceWith(nav);
}

function updateDoctorLoginLinks(data) {
    const nav = gesso.createNav(null, "#doctor-login-links");

    for (const item of Object.values(data.doctors)) {
        gesso.createLink(nav, `/doctor?id=${item.id}`, item.name);
    }

    $("#doctor-login-links").replaceWith(nav);
}

function updateEnvData(data) {
    const env_dict = data.env;

    const host_dict = env_dict["hostname"]
    $("#env-hostname").innerHTML = "<b>" + host_dict["key"] + ": </b>" + host_dict["value"]

    const db_dict = env_dict["db-service-host"]
    $("#env-db_service_host").innerHTML = "<b>" + db_dict["key"] + ": </b>" + db_dict["value"]

    $("#current-date").innerHTML = new Date().toLocaleDateString();
    $("#current-time").innerHTML = new Date().toLocaleTimeString();
}

export class MainPage extends gesso.Page {
    constructor(router) {
        super(router, "/", html);
    }

    updateContent() {
        gesso.fetchJSON("/api/data", data => {
            updatePatientLoginLinks(data);
            updateDoctorLoginLinks(data);
	    updateEnvData(data);
        });
    }
}
