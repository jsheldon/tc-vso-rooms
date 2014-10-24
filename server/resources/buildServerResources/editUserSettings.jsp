<%--
  ~ Copyright 2000-2014 JetBrains s.r.o.
  ~
  ~ Licensed under the Apache License, Version 2.0 (the "License");
  ~ you may not use this file except in compliance with the License.
  ~ You may obtain a copy of the License at
  ~
  ~ http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~ Unless required by applicable law or agreed to in writing, software
  ~ distributed under the License is distributed on an "AS IS" BASIS,
  ~ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  ~ See the License for the specific language governing permissions and
  ~ limitations under the License.
  --%>

<%@ include file="/include.jsp" %>

<bs:linkScript>
  /js/bs/testConnection.js
  /plugins/vso-rooms/js/editSettings.js
</bs:linkScript>

<bs:linkCSS dynamic="${true}">
  /plugins/vso-rooms/css/editSettings.css
</bs:linkCSS>

<jsp:useBean id="settingsBean" type="jetbrains.buildServer.vsoRooms.controllers.VSONotificationUserSettingsBean" scope="request"/>

<c:url value="/vso/userSettings.html?edit=1" var="url"/>

<script type="text/javascript">
  document.observe("dom:loaded", function() {
    VSOTeamRooms.UserSettingsForm.setupEventHandlers();
    $('account').focus();
  });
</script>

<div class="notifierSettings clearfix">
  <form action="${url}" method="post" autocomplete="off" onsubmit="return VSOTeamRooms.UserSettingsForm.submitSettings()">
    <table class="vsoUserSettingsTable">
      <tr>
        <th><label for="account">Account: </label></th>
        <td>
          <forms:textField name="account" value="${settingsBean.account}" />
          &nbsp;&nbsp;<input type="submit" class="btn btn_mini" id="save-btn" value="Save"/>
          &nbsp;&nbsp;<input type="button" class="btn btn_mini" id="test-connection-btn" value="Test Connection"/>
          &nbsp;<forms:saving/>
          <span class="error" id="errorAccount"></span>
        </td>
      </tr>
      <tr>
        <th><label for="teamRoomName">Team Room Name: </label></th>
        <td>
          <forms:textField name="teamRoomName" value="${settingsBean.teamRoomName}"/>
          <span class="error" id="errorTeamRoomName"></span>
        </td>
      </tr>
      <tr>
        <th><label for="username">Username: </label></th>
        <td>
          <forms:textField name="username" value="${settingsBean.username}"/>
          <span class="error" id="errorUsername"></span>
        </td>
      </tr>
      <tr>
        <th><label for="password">Password: </label></th>
        <td>
          <forms:passwordField name="password" encryptedPassword="${settingsBean.encryptedPassword}"/>
          <span class="error" id="errorPassword"></span>
        </td>
      </tr>
    </table>

    <input type="hidden" id="submitSettings" name="submitSettings" value="store"/>
    <input type="hidden" id="publicKey" name="publicKey" value="<c:out value='${settingsBean.hexEncodedPublicKey}'/>"/>

  </form>
</div>

<bs:dialog dialogId="testConnectionDialog" title="Test Connection" closeCommand="BS.TestConnectionDialog.close();"
           closeAttrs="showdiscardchangesmessage='false'">
  <div id="testConnectionStatus"></div>
  <div id="testConnectionDetails" class="mono"></div>
</bs:dialog>

