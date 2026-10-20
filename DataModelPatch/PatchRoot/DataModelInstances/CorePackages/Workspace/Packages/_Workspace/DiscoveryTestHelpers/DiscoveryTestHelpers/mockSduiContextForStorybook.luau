local Parent = script:FindFirstAncestor("DiscoveryTestHelpers").Parent
local SignalsModule = require(Parent.Signals)
local Localization = require(Parent.RobloxAppLocales).Localization
local _ = require(Parent.SduiCoreSystem)

return function(Callback: (any) -> ())
	-- upvalues: Localization (copy), SignalsModule (copy)
	local _registeredComponents = {}
	
	if Callback then
		Callback(_registeredComponents)
	end
	local Signal = SignalsModule.createSignal({
		numColumns = 3,
		fractionalItemAmount = 0,
		columnGap = 24,
		sideMargin = 24,
		verticalPadding = 16,
		itemWidth = 0
	})
	
	return {
		appPage = "Home",
		dataUpdatedTimestamp = os.clock(),
		dependencies = {
			appAnalytics = nil,
			gameAnalytics = nil,
			eventIngest = nil,
			sessionService = nil,
			networking = nil,
			dispatch = function(_) end,
			getNavigation = function()
				return { navigate = function() end }
			end,
			linkingProtocol = {
				detectURL = function() end,
				isURLRegistered = function(_, p1): boolean
					return p1 == "roblox://registered-with-mock/"
				end
			},
			logger = {
				reportCounter = function(_, _, _, _) end,
				reportError = function(_, _, _, _) end,
				clearSeenErrors = function() end,
				reportTimers = function(_, _, _) end,
				reportOmniFeedStats = function(_, _, _, _, _) end
			},
			cursors = { tileCursor = nil },
			instrumentation = {
				startTimerFlow = function(_, _) end,
				stopTimerFlow = function(_, _, _, _) end,
				scheduleFlush = function(_, _) end,
				reportTimers = function(_, _) end
			},
			localization = Localization.new("en-us")
		},
		componentDefinitions = {
			_registeredComponents = _registeredComponents,
			doesComponentManageChildren = function(_, _): boolean
				return false
			end,
			registerComponent = function(_, Key, p1)
				-- upvalues: _registeredComponents (copy)
				_registeredComponents[Key] = p1
			end,
			getComponent = function(_, p1)
				-- upvalues: _registeredComponents (copy)
				local RegisteredComponent = _registeredComponents[p1]
				
				return if RegisteredComponent then RegisteredComponent.component else nil
			end,
			getPropParsers = function(_, p1)
				-- upvalues: _registeredComponents (copy)
				local RegisteredComponent = _registeredComponents[p1]
				
				return if RegisteredComponent then RegisteredComponent.propParsers else nil
			end,
			getPropInterface = function(_, p1)
				-- upvalues: _registeredComponents (copy)
				local RegisteredComponent = _registeredComponents[p1]
				
				return if RegisteredComponent then RegisteredComponent.propInterface else nil
			end,
			doesParserRequireRenderContext = function(_, _): boolean
				return false
			end
		},
		templateRegistry = {
			new = function(_)
				return nil
			end,
			getTemplate = function(_, _)
				return nil
			end,
			resolveTemplateForConfig = function(_, _, _)
				return nil
			end,
			shouldResolveTemplate = function(_, _): boolean
				return false
			end,
			_registeredTemplates = {}
		},
		dataStore = {
			social = { getInGameFriendsByGame = SignalsModule.createSignal({}) }
		},
		getPageLayoutConfig = function(_)
			-- upvalues: SignalsModule (upval), Signal (copy)
			return SignalsModule.createComputed(function(p1)
				-- upvalues: Signal (upval)
				return Signal(p1)
			end)
		end
	}
end