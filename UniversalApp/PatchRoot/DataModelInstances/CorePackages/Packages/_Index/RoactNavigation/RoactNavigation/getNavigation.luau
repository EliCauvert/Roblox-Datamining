local Parent = script.Parent
local Object = require(Parent.Parent.LuauPolyfill).Object
local EventsModule = require(Parent.Events)
local GetNavigationActionCreatorsModule = require(Parent.routers.getNavigationActionCreators)
local GetChildNavigationModule = require(Parent.getChildNavigation)
local GetChildrenNavigationCacheModule = require(Parent.getChildrenNavigationCache)

return function(Router, State, Dispatch, p1, GetScreenProps, Callback) --[[ Line: 13 ]]
	-- upvalues: GetChildrenNavigationCacheModule (copy), GetChildNavigationModule (copy), EventsModule (copy), Object (copy), GetNavigationActionCreatorsModule (copy)
	local ActionCreators = Router.getActionCreators(State, nil)
	local config = {
		actions = ActionCreators,
		router = Router,
		state = State,
		dispatch = Dispatch,
		getScreenProps = GetScreenProps,
		_dangerouslyGetParent = function() --[[ Line: 24 ]]
			return nil
		end,
		isFirstRouteInParent = function(): boolean --[[ Line: 27 ]]
			return true
		end,
		_childrenNavigation = GetChildrenNavigationCacheModule(Callback())
	}
	
	function config.getChildNavigation(p2) --[[ Line: 33 ]]
		-- upvalues: GetChildNavigationModule (upval), config (copy), Callback (copy)
		return GetChildNavigationModule(config, p2, Callback)
	end
	
	function config.isFocused(Key): boolean --[[ Line: 37 ]]
		-- upvalues: Callback (copy)
		local State = Callback().state
		local Routes = State.routes
		local Index = State.index
		
		return Key == nil or Routes[Index].key == Key
	end
	
	function config.addListener(Action, Key) --[[ Line: 45 ]]
		-- upvalues: EventsModule (upval), p1 (copy)
		if Action == EventsModule.Action then
			p1[Key] = true
			
			return {
				remove = function() --[[ Line: 51 ]]
					-- upvalues: p1 (upval), Key (copy)
					p1[Key] = nil
				end
			}
		else
			return { remove = function() --[[ Line: 47 ]] end }
		end
	end
	
	local AssignResult = Object.assign(GetNavigationActionCreatorsModule(config.state), ActionCreators)
	
	for i, _ in AssignResult do
		config[i] = function(...) --[[ Line: 61 ]]
			-- upvalues: config (copy), AssignResult (copy), i (copy)
			config.dispatch(AssignResult[i](...))
		end
	end
	return config
end