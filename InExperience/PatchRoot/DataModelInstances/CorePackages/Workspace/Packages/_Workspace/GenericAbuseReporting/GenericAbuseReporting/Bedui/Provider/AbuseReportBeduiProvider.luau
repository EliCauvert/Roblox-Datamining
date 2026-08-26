local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local reactModule = require(parent.React)
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local abuseReportBeduiContextModule = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiContext)
local abuseReportBeduiContextStatus = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes).AbuseReportBeduiContextStatus
local abuseVectorModule = require(genericAbuseReporting.Enums.AbuseVector)
local fetchBeduiDataModule = require(genericAbuseReporting.Bedui.Provider.fetchBeduiData)
local validateBeduiDataModule = require(genericAbuseReporting.Bedui.Provider.validateBeduiData)
local fallbackGenericAbuseReporting = game:DefineFastFlag("FallbackGenericAbuseReporting", false)

return function(p1)
	-- upvalues: reactModule (ref), abuseReportBeduiContextStatus (ref), useRoactService (ref), roactNetworking (ref), fetchBeduiDataModule (ref), validateBeduiDataModule (ref), fallbackGenericAbuseReporting (ref), abuseVectorModule (ref), abuseReportBeduiContextModule (ref)
	local var1, var2 = reactModule.useState({ status = abuseReportBeduiContextStatus.Loading })
	local var3 = useRoactService(roactNetworking)
	reactModule.useEffect(function()
		-- upvalues: fetchBeduiDataModule (copy), var3 (ref), p1 (ref), validateBeduiDataModule (copy), fallbackGenericAbuseReporting (copy), abuseVectorModule (copy), var2 (ref), abuseReportBeduiContextStatus (copy)
		fetchBeduiDataModule(var3, p1.abuseVector):andThen(function(p2)
			-- upvalues: validateBeduiDataModule (copy), fallbackGenericAbuseReporting (copy), fetchBeduiDataModule (copy), var3 (copy), abuseVectorModule (copy), var2 (copy), abuseReportBeduiContextStatus (copy)
			local var4, var5 = validateBeduiDataModule(p2.responseBody)
			
			if var4 then
				var2({
					status = abuseReportBeduiContextStatus.Success,
					beduiData = p2.responseBody
				})
				
				return
			end
			warn("Invalid Bedui data:", var5)
			
			if fallbackGenericAbuseReporting then
				fetchBeduiDataModule(var3, abuseVectorModule.Common):andThen(function(p3)
					-- upvalues: validateBeduiDataModule (copy), var2 (copy), abuseReportBeduiContextStatus (copy)
					local var6, var7 = validateBeduiDataModule(p3.responseBody)
					
					if var6 then
						var2({
							status = abuseReportBeduiContextStatus.Success,
							beduiData = p3.responseBody
						})
						
						return
					end
					warn("Invalid Bedui common data:", var7)
					var2({
						status = abuseReportBeduiContextStatus.Error,
						error = var7
					})
				end):catch(function(p3)
					-- upvalues: var2 (copy), abuseReportBeduiContextStatus (copy)
					warn("Failed to get Bedui common data")
					var2({ status = abuseReportBeduiContextStatus.Error, error = p3 })
				end)
				
				return
			end
			var2({
				status = abuseReportBeduiContextStatus.Error,
				error = var5
			})
		end):catch(function(p2)
			-- upvalues: var2 (copy), abuseReportBeduiContextStatus (copy)
			warn("Failed to get Bedui data")
			var2({ status = abuseReportBeduiContextStatus.Error, error = p2 })
		end)
	end, { p1.abuseVector })
	
	return reactModule.createElement(abuseReportBeduiContextModule.Provider, { value = var1 }, p1.children)
end