﻿<#-- Uses FreeMarker template syntax, template guide can be found at http://freemarker.org/docs/dgui.html -->

<#import "common.ftl" as common>
<#import "responsibility.ftl" as resp>

<#global message>${responsibleUser} is assigned for investigation of tests failure in ${project.fullName}
(${testNames?first} and ${testNames?size - 1} more),
assigned by ${reporterUser}

<@resp.removeMethod responsibility/>
<@resp.comment responsibility/>
${link.myResponsibilitiesLink}</#global>
