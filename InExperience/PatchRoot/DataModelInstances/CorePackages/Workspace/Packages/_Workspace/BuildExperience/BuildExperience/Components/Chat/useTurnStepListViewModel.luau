local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local _ = require(BuildExperience.Chat.chatTypes)
local UseStepRowsFunction = require(script.Parent.useStepRows).useStepRows

return function(p1)
	-- upvalues: UseStepRowsFunction (copy), ReactModule (copy)
	local UseStepRowsResult = UseStepRowsFunction(p1.segment)
	local CountUseStepRowsResult = #UseStepRowsResult
	local OnRowCountFunction = p1.onRowCount
	local Key = p1.segment.key
	local OpenRows = p1.openRows
	local OnToggleRowFunction = p1.onToggleRow
	ReactModule.useLayoutEffect(function()
		-- upvalues: OnRowCountFunction (copy), Key (copy), CountUseStepRowsResult (copy)
		if OnRowCountFunction ~= nil then
			OnRowCountFunction(Key, CountUseStepRowsResult)
		end
		return nil
	end, { OnRowCountFunction, Key, CountUseStepRowsResult })
	local StartIndex = p1.startIndex or 0
	local Rows = {}
	
	for i, value in UseStepRowsResult do
		local IsIsRunning = value.isRunning == true
		local Text: string = `{Key}:{value.key}`
		table.insert(Rows, {
			key = value.key,
			index = StartIndex + i,
			title = value.title,
			body = if IsIsRunning then nil else value.body,
			isRunning = IsIsRunning,
			isLast = p1.isLastList and i == CountUseStepRowsResult,
			isExpanded = OpenRows ~= nil and OpenRows[Text] == true,
			onToggle = function()
				-- upvalues: OnToggleRowFunction (copy), Text (copy)
				if OnToggleRowFunction ~= nil then
					OnToggleRowFunction(Text)
				end
			end
		})
	end
	return { rows = Rows }
end