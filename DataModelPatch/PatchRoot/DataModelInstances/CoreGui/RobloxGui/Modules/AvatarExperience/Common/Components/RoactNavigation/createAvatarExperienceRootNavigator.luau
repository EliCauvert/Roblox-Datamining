local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local StackRouterFunction = require(CorePackages.Packages.RoactNavigation).StackRouter
local AvatarRootNavigationAction = AvatarExperienceNavigationModule.Enums.AvatarRootNavigationAction
local CustomGetStateForAction = AvatarExperienceNavigationModule.Enums.CustomGetStateForAction

return function(p1, p2)
	-- upvalues: CryoModule (copy), AvatarRootNavigationAction (copy), StackRouterFunction (copy), CustomGetStateForAction (copy)
	local StackRouterResult = StackRouterFunction(p1, (CryoModule.Dictionary.join(p2 or {}, {
		getCustomActionCreators = function(_, _)
			-- upvalues: AvatarRootNavigationAction (upval)
			return table.clone(AvatarRootNavigationAction)
		end
	})))
	local Handlers = {}
	setmetatable(Handlers, { __mode = "v" })
	local GetStateForActionFunction = StackRouterResult.getStateForAction
	
	function StackRouterResult.getStateForAction(p3, p4)
		-- upvalues: AvatarRootNavigationAction (upval), CustomGetStateForAction (upval), Handlers (copy), GetStateForActionFunction (copy)
		if p3.type == AvatarRootNavigationAction.RegisterCustomGetStateForAction then
			if CustomGetStateForAction.HandlerId[p3.handlerId] then
				Handlers[p3.handlerId] = p3.handler
			else
				warn(`Invalid custom getStateForAction handler id: {p3.handlerId}`)
			end
			return GetStateForActionFunction(p3, p4)
		else
			if p3.type == AvatarRootNavigationAction.DeregisterCustomGetStateForAction then
				Handlers[p3.handlerId] = nil
				
				return GetStateForActionFunction(p3, p4)
			end
			local HandlerResult2 = nil
			for _, value in CustomGetStateForAction.Ordering do
				local Handler = Handlers[value]
				
				if Handler then
					local HandlerResult
					HandlerResult, HandlerResult2 = Handler(p3, p4)
					
					if HandlerResult then
						return HandlerResult2
					end
				end
			end
			return GetStateForActionFunction(p3, p4)
		end
	end
	
	return StackRouterResult
end