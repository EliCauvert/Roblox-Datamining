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

return function(p0)
	-- upvalues: reactModule (ref), abuseReportBeduiContextStatus (ref), useRoactService (ref), roactNetworking (ref), fetchBeduiDataModule (ref), validateBeduiDataModule (ref), fallbackGenericAbuseReporting (ref), abuseVectorModule (ref), abuseReportBeduiContextModule (ref)
	local var7, var8 = reactModule.useState({ status = abuseReportBeduiContextStatus.Loading })
	local var9 = useRoactService(roactNetworking)
	reactModule.useEffect(function()
		-- upvalues: fetchBeduiDataModule (copy), var9 (ref), p0 (ref), validateBeduiDataModule (copy), fallbackGenericAbuseReporting (copy), abuseVectorModule (copy), var8 (ref), abuseReportBeduiContextStatus (copy)
		fetchBeduiDataModule(var9, p0.abuseVector):andThen(function(p2)
			-- upvalues: validateBeduiDataModule (copy), fallbackGenericAbuseReporting (copy), fetchBeduiDataModule (copy), var9 (copy), abuseVectorModule (copy), var8 (copy), abuseReportBeduiContextStatus (copy)
			local var10, var11 = validateBeduiDataModule(p2.responseBody)
			
			if var10 then
				var8({
					status = abuseReportBeduiContextStatus.Success,
					beduiData = p2.responseBody
				})
				
				return
			end
			warn("Invalid Bedui data:", var11)
			
			if fallbackGenericAbuseReporting then
				fetchBeduiDataModule(var9, abuseVectorModule.Common):andThen(function(p4)
					-- upvalues: validateBeduiDataModule (copy), var8 (copy), abuseReportBeduiContextStatus (copy)
					local var12, var13 = validateBeduiDataModule(p4.responseBody)
					
					if var12 then
						var8({
							status = abuseReportBeduiContextStatus.Success,
							beduiData = p4.responseBody
						})
						
						return
					end
					warn("Invalid Bedui common data:", var13)
					var8({
						status = abuseReportBeduiContextStatus.Error,
						error = var13
					})
				end):catch(function(p3)
					-- upvalues: var8 (copy), abuseReportBeduiContextStatus (copy)
					warn("Failed to get Bedui common data")
					var8({ status = abuseReportBeduiContextStatus.Error, error = p3 })
				end)
				
				return
			end
			var8({
				status = abuseReportBeduiContextStatus.Error,
				error = var11
			})
		end):catch(function(p1)
			-- upvalues: var8 (copy), abuseReportBeduiContextStatus (copy)
			warn("Failed to get Bedui data")
			var8({ status = abuseReportBeduiContextStatus.Error, error = p1 })
		end)
	end, { p0.abuseVector })
	
	return reactModule.createElement(abuseReportBeduiContextModule.Provider, { value = var7 }, p0.children)
end