local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local ReactModule = require(Parent.React)
local UseDrawerVisibleFunction = require(Parent.Drawer).Hooks.useDrawerVisible
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppSessionService = require(Parent.RoactServiceTags).AppSessionService
local Level2b = require(Parent.RobloxAppSessionization).SessionType.StructuralIdentifier.Level2b

local function _(SessionService)
	-- upvalues: Level2b (copy)
	if SessionService:SessionExists(Level2b) and not SessionService:SessionExists("flyout") then
		SessionService:SetSession(Level2b, "flyout", "Flyout")
	end
end

local _ = function(SessionService)
	if SessionService:SessionExists("flyout") then
		SessionService:RemoveSession("flyout")
	end
end

return function()
	-- upvalues: UseDrawerVisibleFunction (copy), UseRoactServiceFunction (copy), AppSessionService (copy), ReactModule (copy), Level2b (copy)
	local UseDrawerVisibleResult = UseDrawerVisibleFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(AppSessionService)
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRoactServiceResult (copy), UseDrawerVisibleResult (copy), Level2b (upval)
		if UseRoactServiceResult == nil then return end
		if UseDrawerVisibleResult then
			if UseRoactServiceResult:SessionExists(Level2b) and not UseRoactServiceResult:SessionExists("flyout") then
				UseRoactServiceResult:SetSession(Level2b, "flyout", "Flyout")
			end
			local SessionChangedSignalConnection = if typeof(UseRoactServiceResult) == "Instance" or UseRoactServiceResult.SessionChangedSignal == nil then nil else UseRoactServiceResult.SessionChangedSignal:connect(function(p1)
				-- upvalues: UseRoactServiceResult (copy), Level2b (upval)
				if p1 ~= "flyout" and UseRoactServiceResult:SessionExists(Level2b) and not UseRoactServiceResult:SessionExists("flyout") then
					UseRoactServiceResult:SetSession(Level2b, "flyout", "Flyout")
				end
			end)
			
			return function()
				-- upvalues: SessionChangedSignalConnection (ref), UseRoactServiceResult (copy)
				if SessionChangedSignalConnection ~= nil then
					SessionChangedSignalConnection:disconnect()
				end
				if UseRoactServiceResult:SessionExists("flyout") then
					UseRoactServiceResult:RemoveSession("flyout")
				end
			end
		elseif UseRoactServiceResult:SessionExists("flyout") then
			UseRoactServiceResult:RemoveSession("flyout")
		end
	end, { UseDrawerVisibleResult, UseRoactServiceResult })
end