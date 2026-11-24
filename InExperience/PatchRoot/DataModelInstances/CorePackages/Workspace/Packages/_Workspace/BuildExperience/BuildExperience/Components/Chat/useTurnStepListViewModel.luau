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
	local AutoOpenRowId = p1.autoOpenRowId
	local LoadingRowId = p1.loadingRowId
	local OnNewestSummaryFunction = p1.onNewestSummary
	ReactModule.useLayoutEffect(function()
		-- upvalues: OnRowCountFunction (copy), Key (copy), CountUseStepRowsResult (copy)
		if OnRowCountFunction ~= nil then
			OnRowCountFunction(Key, CountUseStepRowsResult)
		end
		return nil
	end, { OnRowCountFunction, Key, CountUseStepRowsResult })
	local Key1 = nil
	
	for i = CountUseStepRowsResult, 1, -1 do
		if UseStepRowsResult[i].body == nil then
			continue
		end
		Key1 = UseStepRowsResult[i].key
		break
	end
	ReactModule.useLayoutEffect(function()
		-- upvalues: OnNewestSummaryFunction (copy), Key (copy), Key1 (ref)
		if OnNewestSummaryFunction ~= nil then
			OnNewestSummaryFunction(Key, Key1)
		end
		return nil
	end, { OnNewestSummaryFunction, Key, Key1 })
	local StartIndex = p1.startIndex or 0
	local Rows = {}
	
	for i1, value in UseStepRowsResult do
		local Text: string = `{Key}:{value.key}`
		local OpenRow = if OpenRows == nil then nil else OpenRows[Text]
		local IsTextMatch = if OpenRow == nil then Text == AutoOpenRowId else OpenRow
		table.insert(Rows, {
			key = value.key,
			index = StartIndex + i1,
			title = value.title,
			body = value.body,
			markdown = value.markdown,
			answers = value.answers,
			isRunning = value.isRunning == true or Text == LoadingRowId,
			isFailed = value.isFailed == true,
			isLast = p1.isLastList and i1 == CountUseStepRowsResult,
			isExpanded = IsTextMatch,
			onToggle = function()
				-- upvalues: OnToggleRowFunction (copy), Text (copy), IsTextMatch (copy)
				if OnToggleRowFunction ~= nil then
					OnToggleRowFunction(Text, not IsTextMatch)
				end
			end
		})
	end
	return { rows = Rows }
end