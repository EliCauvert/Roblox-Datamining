local Parent = script:FindFirstAncestor("Moments").Parent
local _ = require(Parent.MomentsTypes)
local MakeMomentViewBeganFieldsModule = require(script.Parent.makeMomentViewBeganFields)
local Analytics = require(Parent.MomentsCommon).Analytics
local EventNames = Analytics.EventNames

return function(p1, p2, p3, p4) --[[ Line: 15 | Named "logMomentViewBegan" ]]
	-- upvalues: Analytics (copy), MakeMomentViewBeganFieldsModule (copy), EventNames (copy)
	Analytics.reportMomentsViewBegan(p2)
	local MomentViewBeganFieldsModule = MakeMomentViewBeganFieldsModule(p1, p2, p3, p4)
	
	if MomentViewBeganFieldsModule ~= nil then
		Analytics.fireAnalyticsEvent(EventNames.MomentViewBegan, MomentViewBeganFieldsModule)
	end
end