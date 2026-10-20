local ServerTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local Parent = ServerTriggeredModals.Parent
local ReactModule = require(Parent.React)
local SduiFeatureEntryPoint = require(Parent.SduiSharedUtilities).SduiFeatureEntryPoint
local LoggerModule = require(ServerTriggeredModals.Logger)
local ReportPromptImpressionModule = require(ServerTriggeredModals.reportPromptImpression)
local SendModalImpressionEventModule = require(ServerTriggeredModals.sendModalImpressionEvent)
local PromptStyleModule = require(ServerTriggeredModals.SduiV2.PromptStyle)
local UsePromptEntriesModule = require(ServerTriggeredModals.SduiV2.usePromptEntries)
local UseModalSignalStoreModule = require(ServerTriggeredModals.SignalStores.useModalSignalStore)

return ReactModule.memo(function(p1)
	-- upvalues: UseModalSignalStoreModule (copy), ReactModule (copy), UsePromptEntriesModule (copy), PromptStyleModule (copy), ReportPromptImpressionModule (copy), LoggerModule (copy), SendModalImpressionEventModule (copy), SduiFeatureEntryPoint (copy)
	local SurfaceConfig = p1.surfaceConfig
	local HasShownKey = p1.hasShownKey
	local UseModalSignalStoreModuleResult = UseModalSignalStoreModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseModalSignalStoreModuleResult (copy), HasShownKey (copy), UseStateResult2 (copy)
		if not UseStateResult and UseModalSignalStoreModuleResult.tryClaimPrimaryHandler(HasShownKey) then
			UseStateResult2(true)
		end
		return function()
			-- upvalues: UseStateResult (upval), UseModalSignalStoreModuleResult (upval), HasShownKey (upval)
			if UseStateResult then
				UseModalSignalStoreModuleResult.releasePrimaryHandler(HasShownKey)
			end
		end
	end, {
		UseStateResult,
		HasShownKey,
		UseModalSignalStoreModuleResult
	})
	local UsePromptEntriesModuleResult = UsePromptEntriesModule(SurfaceConfig.configKey, PromptStyleModule.Coachmark)
	local UseMemoResult = ReactModule.useMemo(function(): string
		-- upvalues: UseStateResult (copy), UsePromptEntriesModuleResult (copy)
		if not UseStateResult then
			return ""
		end
		local List = {}
		
		for _, value in UsePromptEntriesModuleResult do
			if value.identifier and value.title and value.config then
				table.insert(List, `{value.identifier}:{value.title}`)
			end
		end
		return table.concat(List, "|")
	end, { UseStateResult, UsePromptEntriesModuleResult })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), UsePromptEntriesModuleResult (copy), ReportPromptImpressionModule (upval), LoggerModule (upval), SendModalImpressionEventModule (upval)
		if UseMemoResult == "" then return end
		for _, value in UsePromptEntriesModuleResult do
			if value.identifier and value.title and value.config then
				ReportPromptImpressionModule(value.title, value.identifier):catch(function()
					-- upvalues: LoggerModule (upval)
					LoggerModule:warning("Failed to report coachmark prompt impression")
				end)
				SendModalImpressionEventModule(value.identifier, value.title)
			end
		end
	end, { UseMemoResult })
	
	if not UseStateResult then
		return nil
	end
	local Elements = {}
	
	for _, value in UsePromptEntriesModuleResult do
		if value.config ~= nil and value.identifier ~= nil and value.title ~= nil then
			Elements[value.identifier] = ReactModule.createElement(SduiFeatureEntryPoint, {
				shouldDisplayLoading = false,
				shouldDisplayError = false,
				configKey = SurfaceConfig.configKey,
				identifier = value.identifier,
				appPage = SurfaceConfig.appPage
			})
		end
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, Elements)
end)