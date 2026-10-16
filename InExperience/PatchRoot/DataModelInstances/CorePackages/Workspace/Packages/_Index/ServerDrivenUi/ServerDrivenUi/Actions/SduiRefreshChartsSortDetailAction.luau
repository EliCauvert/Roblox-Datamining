local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiLoadTimer = require(Parent.SduiSharedUtilities).SduiLoadTimer
local RefreshChartsSortDetailGenreFunction = require(Parent.Charts).refreshChartsSortDetailGenre

local function _(p1, Message, PropName) --[[ Line: 19 | Named "reportInvalidActionParams" ]]
	-- upvalues: SduiErrorType (copy), SduiActionType (copy)
	p1.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
		name = SduiActionType.RefreshChartsSortDetail,
		message = Message,
		propName = PropName
	}, p1.appPage)
end

return function(p1, _, p2) --[[ Line: 27 | Named "SduiRefreshChartsSortDetailAction" ]]
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), SduiLoadTimer (copy), RefreshChartsSortDetailGenreFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			propName = nil,
			name = SduiActionType.RefreshChartsSortDetail
		}, p2.appPage)
		
		return
	end
	assert(ActionParams, "actionParams must exist")
	local ConfigKey = p2.configKey
	
	if typeof(ConfigKey) ~= "string" or ConfigKey == "" then
		ConfigKey = ActionParams.configKey
	end
	if typeof(ConfigKey) ~= "string" or ConfigKey == "" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "configKey",
			name = SduiActionType.RefreshChartsSortDetail,
			message = `Invalid or missing configKey: {ConfigKey}`
		}, p2.appPage)
		
		return
	end
	local SelectedOption = ActionParams.selectedOption
	
	if typeof(SelectedOption) ~= "string" or SelectedOption == "" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "selectedOption",
			name = SduiActionType.RefreshChartsSortDetail,
			message = `Invalid or missing selectedOption: {SelectedOption}`
		}, p2.appPage)
		
		return
	end
	local ChartsSortDetail = SduiLoadTimer.createLoadTimer("ChartsSortDetail")
	ChartsSortDetail.start("refresh")
	local RefreshChartsSortDetailGenreResult = RefreshChartsSortDetailGenreFunction({
		configKey = ConfigKey,
		selectedGenre = SelectedOption,
		loadTimer = ChartsSortDetail
	})
	
	if RefreshChartsSortDetailGenreResult then
		RefreshChartsSortDetailGenreResult:finally(function() --[[ Line: 71 ]]
			-- upvalues: ChartsSortDetail (copy)
			ChartsSortDetail.logRefreshComplete()
		end)
		
		return RefreshChartsSortDetailGenreResult
	else
		return nil
	end
end