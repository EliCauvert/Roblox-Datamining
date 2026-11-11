local Modules = game:GetService("CoreGui").RobloxGui.Modules
local FullView = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceCommon).Enums.FullView
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local SetFullViewModule = require(Modules.AvatarExperience.Common.Actions.SetFullView)

local function _(p1)
	-- upvalues: ConstantsModule (copy), MutedErrorModule (copy)
	local AnalyticsContextEntry = ConstantsModule.AnalyticsContext[p1]
	
	if AnalyticsContextEntry == nil then
		if _G.__TESTEZ_RUNNING_TEST__ and p1 == "DummyRoute" then
			return "DummyRoute"
		end
		MutedErrorModule(string.format("opaquePage: %s missing an entry in AXConstants.AnalyticsContext", (tostring(p1))))
		AnalyticsContextEntry = ""
	end
	return AnalyticsContextEntry
end

local _ = function(p1, SceneFullView, SceneFullView1)
	-- upvalues: FullView (copy)
	if SceneFullView1 == FullView.SceneFullView then
		return p1.open3DFullView
	elseif SceneFullView1 == FullView.UIFullView then
		return p1.openUIFullView
	elseif SceneFullView == FullView.SceneFullView then
		return p1.close3DFullView
	elseif SceneFullView ~= FullView.UIFullView then return end
	return p1.closeUIFullView
end

return function(p1, p2, SceneFullView)
	-- upvalues: SetFullViewModule (copy), ConstantsModule (copy), MutedErrorModule (copy), FullView (copy)
	return function(p3)
		-- upvalues: p2 (copy), SetFullViewModule (upval), SceneFullView (copy), ConstantsModule (upval), MutedErrorModule (upval), p1 (copy), FullView (upval)
		local FullViewEntry = p3:getState().AvatarExperience.Common.FullView[p2]
		p3:dispatch(SetFullViewModule(p2, SceneFullView))
		local AnalyticsContextEntry = ConstantsModule.AnalyticsContext[p2]
		local AnalyticsContextEntry1 = nil
		repeat
			if AnalyticsContextEntry == nil then
				if _G.__TESTEZ_RUNNING_TEST__ and p2 == "DummyRoute" then
					AnalyticsContextEntry1 = "DummyRoute"
					break
				end
				MutedErrorModule(string.format("opaquePage: %s missing an entry in AXConstants.AnalyticsContext", (tostring(p2))))
				AnalyticsContextEntry = ""
			end
			AnalyticsContextEntry1 = AnalyticsContextEntry
		until true
		local Open3DFullView: (any) -> () = if SceneFullView == FullView.SceneFullView then p1.open3DFullView elseif SceneFullView == FullView.UIFullView then p1.openUIFullView elseif FullViewEntry == FullView.SceneFullView then p1.close3DFullView elseif FullViewEntry == FullView.UIFullView then p1.closeUIFullView else nil
		
		if Open3DFullView then
			Open3DFullView(AnalyticsContextEntry1)
		end
	end
end