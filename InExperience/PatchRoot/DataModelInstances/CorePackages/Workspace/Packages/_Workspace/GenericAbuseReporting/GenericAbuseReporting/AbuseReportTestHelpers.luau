local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local reactModule = require(parent.React)
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local roactServices = require(parent.RoactServices).RoactServices
local mockProvidersModule = require(genericAbuseReporting.MockProviders)
local loaderProvider = require(genericAbuseReporting.BeduiV2.Loaders.LoaderContext).LoaderProvider

local function findEventsBySubType(p0, p1, p2)
	local t = {}
	
	for i, v in p0.mock.calls do
		local var5 = v[2]
		
		if var5 and var5.sub_event_type == p1 and (p2 == nil or p2(var5)) then
			table.insert(t, v)
		end
	end
	return t
end

return {
	wrapInAbuseReportProviders = function(p3, p4)
		-- upvalues: reactModule (ref), roactServices (ref), roactNetworking (ref), mockProvidersModule (ref), loaderProvider (ref)
		p4 = p4 or {}
		
		return reactModule.createElement(roactServices.ServiceProvider, { services = { [roactNetworking] = p4.networkImpl or {} } }, {
			Providers = reactModule.createElement(mockProvidersModule, nil, {
				LoaderCtx = reactModule.createElement(loaderProvider, {
					loaders = p4.loaders or {},
					open = p4.loaderOpen ~= nil or p4.loaderOpen
				}, { Child = p3 })
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
	findRenderErrorEvents = function(p5)
		-- upvalues: findEventsBySubType (ref)
		return findEventsBySubType(p5, "Error", function(p6)
			local errorMessage = p6.error_detail and p6.error_detail.error_message
			
			return type(errorMessage) == "string" and errorMessage:sub(1, 13) == "Render error:"
		end)
	end,
	findFetchErrorEvents = function(p7)
		-- upvalues: findEventsBySubType (ref)
		return findEventsBySubType(p7, "Error", function(p8)
			local errorMessage = p8.error_detail and p8.error_detail.error_message
			
			return type(errorMessage) == "string" and errorMessage:sub(1, 23) == "Failed to fetch config:"
		end)
	end
}