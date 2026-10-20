local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local ReactModule = require(Parent.React)
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local RoactServices = require(Parent.RoactServices).RoactServices
local MockProvidersModule = require(GenericAbuseReporting.MockProviders)
local LoaderProvider = require(GenericAbuseReporting.BeduiV2.Loaders.LoaderContext).LoaderProvider

local function findEventsBySubType(p1, SubEventType, Callback)
	local List = {}
	
	for _, call in p1.mock.calls do
		local v1 = call[2]
		
		if v1 and v1.sub_event_type == SubEventType and (Callback == nil or Callback(v1)) then
			table.insert(List, call)
		end
	end
	return List
end

return {
	wrapInAbuseReportProviders = function(Child, p2)
		-- upvalues: ReactModule (copy), RoactServices (copy), RoactNetworking (copy), MockProvidersModule (copy), LoaderProvider (copy)
		local P1 = p2 or {}
		
		return ReactModule.createElement(RoactServices.ServiceProvider, { services = { [RoactNetworking] = P1.networkImpl or {} } }, {
			Providers = ReactModule.createElement(MockProvidersModule, nil, {
				LoaderCtx = ReactModule.createElement(LoaderProvider, {
					loaders = P1.loaders or {},
					open = P1.loaderOpen == nil or P1.loaderOpen
				}, { Child = Child })
			})
		})
	end,
	makeMinimalCloseConfig = function()
		return {
			version = 1,
			resources = {},
			attributes = {},
			display = { closeButtonLabel = "Close" },
			nodes = {
				root = {
					type = "paragraph",
					title = "Root",
					paragraph = "Root paragraph",
					nextButtonText = "Continue",
					next = { type = "close" }
				}
			},
			translations = {}
		}
	end,
	makeListParagraphConfig = function()
		return {
			name = "test_list_paragraph",
			version = 1,
			resources = {},
			attributes = {},
			submission = {
				endpoint = "test",
				data = {
					abuseVector = "test",
					targetIdStr = "test",
					category = "test",
					comment = "test",
					targetType = "user"
				}
			},
			display = { closeButtonLabel = "Close" },
			nodes = {
				root = {
					type = "list",
					eyebrow = "Report",
					title = "Select an option",
					nextButtonText = "Continue",
					items = { { id = "test", label = "TestItem1" } },
					next = { type = "close" }
				}
			},
			translations = {}
		}
	end,
	makeMalformedConfig = function()
		return {
			version = 1,
			resources = {},
			attributes = {},
			display = { closeButtonLabel = "Close" },
			nodes = {},
			translations = {}
		}
	end,
	findEventsBySubType = findEventsBySubType,
	findRenderErrorEvents = function(p2)
		-- upvalues: findEventsBySubType (copy)
		return (findEventsBySubType(p2, "Error", function(p3): boolean
			local ErrorMessage = p3.error_detail and p3.error_detail.error_message
			
			return type(ErrorMessage) == "string" and ErrorMessage:sub(1, 13) == "Render error:"
		end))
	end,
	findFetchErrorEvents = function(p2)
		-- upvalues: findEventsBySubType (copy)
		return (findEventsBySubType(p2, "Error", function(p3): boolean
			local ErrorMessage = p3.error_detail and p3.error_detail.error_message
			
			return type(ErrorMessage) == "string" and ErrorMessage:sub(1, 23) == "Failed to fetch config:"
		end))
	end
}