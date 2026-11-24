local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local _ = require(BuildExperience.Chat.chatTypes)
local UseStepRowsModule = require(script.Parent.useStepRows)
local UseStepRowsFunction = UseStepRowsModule.useStepRows

return function(p1)
	-- upvalues: UseStepRowsFunction (copy), UseStepRowsModule (copy), ReactModule (copy)
	local Key = p1.segment.key
	local OnNamedStepFunction = p1.onNamedStep
	local NamedStep = UseStepRowsModule.getNamedStep(Key, (UseStepRowsFunction(p1.segment)))
	local Key1 = if NamedStep == nil then nil else NamedStep.key
	local Title = if NamedStep == nil then nil else NamedStep.title
	local IsRunning = if NamedStep == nil then nil else NamedStep.isRunning
	local IsFailed = if NamedStep == nil then nil else NamedStep.isFailed
	ReactModule.useLayoutEffect(function()
		-- upvalues: Key1 (copy), Title (copy), IsRunning (copy), OnNamedStepFunction (copy), Key (copy), IsFailed (copy)
		if Key1 ~= nil and Title ~= nil and IsRunning ~= nil then
			OnNamedStepFunction(Key, {
				segmentKey = Key,
				key = Key1,
				title = Title,
				isRunning = IsRunning,
				isFailed = IsFailed
			})
		end
		return function()
			-- upvalues: OnNamedStepFunction (upval), Key (upval)
			OnNamedStepFunction(Key, nil)
		end
	end, {
		OnNamedStepFunction, Key, Key1, Title, IsRunning, IsFailed
	})
end