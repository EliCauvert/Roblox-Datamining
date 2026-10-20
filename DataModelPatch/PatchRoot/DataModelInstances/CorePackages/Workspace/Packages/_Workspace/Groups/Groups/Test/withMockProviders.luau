local Groups = script:FindFirstAncestor("Groups")
local Parent = Groups.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local Enums = FoundationModule.Enums
local MockProvidersFunction = require(Parent.Dev.UnitTestHelpers).mockProviders
local ServiceOverrideContextModule = require(Groups.Components.CoreUI.ServiceOverrideContext)
local GroupsWrapperContextModule = require(Groups.Contexts.GroupsWrapperContext)
local GroupsAnalyticsContextModule = require(Groups.Analytics.GroupsAnalyticsContext)
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local Signal = require(Parent.AppCommonLib).Signal
local Jest = require(Parent.Dev.JestGlobals).jest

return function(p1, p2)
	-- upvalues: Jest (copy), ReactModule (copy), MockProvidersFunction (copy), LocalizationProvider (copy), Signal (copy), FoundationProvider (copy), Enums (copy), GroupsWrapperContextModule (copy), GroupsAnalyticsContextModule (copy), ServiceOverrideContextModule (copy)
	local Navigation = if p2 then p2.navigation else nil
	local GroupsContext = if p2 then p2.groupsContext else nil
	local NavigateTo = if GroupsContext then GroupsContext.navigateTo else nil
	local config = {
		navigateTo = {
			webView = if NavigateTo and NavigateTo.webView then NavigateTo.webView else Jest.fn(),
			groupDetails = if NavigateTo and NavigateTo.groupDetails then NavigateTo.groupDetails else Jest.fn(),
			seeAllGroups = if NavigateTo and NavigateTo.seeAllGroups then NavigateTo.seeAllGroups else Jest.fn(),
			createGroup = if NavigateTo and NavigateTo.createGroup then NavigateTo.createGroup else Jest.fn()
		},
		userId = if GroupsContext and GroupsContext.userId then GroupsContext.userId else "12345"
	}
	local config1 = { fireAnalyticsEvent = Jest.fn() }
	
	return ReactModule.createElement(ServiceOverrideContextModule.Provider, {
		value = {
			groupService = {
				ShowJoinPrompt = Instance.new("BindableEvent"),
				PromptJoinCompleted = Jest.fn(function(_, _, _, _) end)
			},
			guiService = {
				SendNotification = Jest.fn(function(_) end)
			}
		}
	}, {
		Element = ReactModule.createElement(GroupsAnalyticsContextModule.Provider, { value = config1 }, {
			Element = ReactModule.createElement(GroupsWrapperContextModule.Provider, { value = config }, {
				Element = ReactModule.createElement(FoundationProvider, { device = Enums.Device.Desktop, theme = Enums.Theme.Dark }, {
					Element = ReactModule.createElement(LocalizationProvider, {
						localization = {
							Format = function(_, p3, _)
								return p3
							end,
							GetLocale = function(): string
								return "en-us"
							end,
							changed = Signal.new()
						}
					}, {
						Element = MockProvidersFunction(ReactModule.createElement(ReactModule.Fragment, nil, p1), { mockFoundation = false })
					})
				})
			})
		})
	}), {
		goBack = if Navigation and Navigation.goBack then Navigation.goBack else Jest.fn(),
		navigate = if Navigation and Navigation.navigate then Navigation.navigate else Jest.fn(),
		pop = if Navigation and Navigation.pop then Navigation.pop else Jest.fn(),
		state = {},
		getScreenProps = function()
			return nil
		end
	}, config, config1
end