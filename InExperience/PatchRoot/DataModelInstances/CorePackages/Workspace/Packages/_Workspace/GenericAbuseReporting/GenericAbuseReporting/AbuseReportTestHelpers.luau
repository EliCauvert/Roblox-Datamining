local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local reactModule = require(parent.React)
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local roactServices = require(parent.RoactServices).RoactServices
local mockProvidersModule = require(genericAbuseReporting.MockProviders)
local loaderProvider = require(genericAbuseReporting.BeduiV2.Loaders.LoaderContext).LoaderProvider

local function findEventsBySubType(p1, p2, p3)
	local t = {}
	
	for i, v in p1.mock.calls do
		local var1 = v[2]
		
		if var1 and var1.sub_event_type == p2 and (p3 == nil or p3(var1)) then
			table.insert(t, v)
		end
	end
	return t
end

return {
	wrapInAbuseReportProviders = function(p4, p5)
		-- upvalues: reactModule (ref), roactServices (ref), roactNetworking (ref), mockProvidersModule (ref), loaderProvider (ref)
		p5 = p5 or {}
		
		return reactModule.createElement(roactServices.ServiceProvider, { services = { [roactNetworking] = p5.networkImpl or {} } }, {
			Providers = reactModule.createElement(mockProvidersModule, nil, {
				LoaderCtx = reactModule.createElement(loaderProvider, {
					loaders = p5.loaders or {},
					open = p5.loaderOpen ~= nil or p5.loaderOpen
				}, { Child = p4 })
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
	findRenderErrorEvents = function(p4)
		-- upvalues: findEventsBySubType (ref)
		return findEventsBySubType(p4, "Error", function(p5)
			local errorMessage = p5.error_detail and p5.error_detail.error_message
			
			return type(errorMessage) == "string" and errorMessage:sub(1, 13) == "Render error:"
		end)
	end,
	findFetchErrorEvents = function(p4)
		-- upvalues: findEventsBySubType (ref)
		return findEventsBySubType(p4, "Error", function(p5)
			local errorMessage = p5.error_detail and p5.error_detail.error_message
			
			return type(errorMessage) == "string" and errorMessage:sub(1, 23) == "Failed to fetch config:"
		end)
	end
}