local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local ReactModule = require(Parent.React)
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AbuseReportBeduiContextModule = require(GenericAbuseReporting.Bedui.Provider.AbuseReportBeduiContext)
local AbuseReportBeduiContextStatus = require(GenericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes).AbuseReportBeduiContextStatus
local AbuseVectorModule = require(GenericAbuseReporting.Enums.AbuseVector)
local FetchBeduiDataModule = require(GenericAbuseReporting.Bedui.Provider.fetchBeduiData)
local ValidateBeduiDataModule = require(GenericAbuseReporting.Bedui.Provider.validateBeduiData)

return function(p1) --[[ Line: 33 | Named "AbuseReportBeduiProvider" ]]
	-- upvalues: ReactModule (copy), AbuseReportBeduiContextStatus (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), FetchBeduiDataModule (copy), ValidateBeduiDataModule (copy), AbuseVectorModule (copy), AbuseReportBeduiContextModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({ status = AbuseReportBeduiContextStatus.Loading })
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	ReactModule.useEffect(function() --[[ Line: 39 ]]
		-- upvalues: FetchBeduiDataModule (upval), UseRoactServiceResult (copy), p1 (copy), ValidateBeduiDataModule (upval), AbuseVectorModule (upval), UseStateResult2 (copy), AbuseReportBeduiContextStatus (upval)
		FetchBeduiDataModule(UseRoactServiceResult, p1.abuseVector):andThen(function(Result) --[[ Line: 41 ]]
			-- upvalues: ValidateBeduiDataModule (upval), FetchBeduiDataModule (upval), UseRoactServiceResult (upval), AbuseVectorModule (upval), UseStateResult2 (upval), AbuseReportBeduiContextStatus (upval)
			local ValidateBeduiDataModuleResult, ValidateBeduiDataModuleResult2 = ValidateBeduiDataModule(Result.responseBody)
			
			if ValidateBeduiDataModuleResult then
				UseStateResult2({
					status = AbuseReportBeduiContextStatus.Success,
					beduiData = Result.responseBody
				})
				
				return
			else
				warn("Invalid Bedui data:", ValidateBeduiDataModuleResult2)
				FetchBeduiDataModule(UseRoactServiceResult, AbuseVectorModule.Common):andThen(function(Result) --[[ Line: 47 ]]
					-- upvalues: ValidateBeduiDataModule (upval), UseStateResult2 (upval), AbuseReportBeduiContextStatus (upval)
					local ValidateBeduiDataModuleResult, ValidateBeduiDataModuleResult2 = ValidateBeduiDataModule(Result.responseBody)
					
					if ValidateBeduiDataModuleResult then
						UseStateResult2({
							status = AbuseReportBeduiContextStatus.Success,
							beduiData = Result.responseBody
						})
						
						return
					else
						warn("Invalid Bedui common data:", ValidateBeduiDataModuleResult2)
						UseStateResult2({
							status = AbuseReportBeduiContextStatus.Error,
							error = ValidateBeduiDataModuleResult2
						})
					end
				end):catch(function(Err) --[[ Line: 63 ]]
					-- upvalues: UseStateResult2 (upval), AbuseReportBeduiContextStatus (upval)
					warn("Failed to get Bedui common data")
					UseStateResult2({
						status = AbuseReportBeduiContextStatus.Error,
						error = Err
					})
				end)
			end
		end):catch(function(Err) --[[ Line: 77 ]]
			-- upvalues: UseStateResult2 (upval), AbuseReportBeduiContextStatus (upval)
			warn("Failed to get Bedui data")
			UseStateResult2({
				status = AbuseReportBeduiContextStatus.Error,
				error = Err
			})
		end)
	end, { p1.abuseVector })
	
	return ReactModule.createElement(AbuseReportBeduiContextModule.Provider, { value = UseStateResult }, p1.children)
end