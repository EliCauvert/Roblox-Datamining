local serverTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local parent = serverTriggeredModals.Parent
local reactModule = require(parent.React)
local sduiFeatureEntryPoint = require(parent.SduiSharedUtilities).SduiFeatureEntryPoint
local loggerModule = require(serverTriggeredModals.Logger)
local reportPromptImpressionModule = require(serverTriggeredModals.reportPromptImpression)
local sendModalImpressionEvent = require(parent.ServerTriggeredModalImpressions).sendModalImpressionEvent
local promptStyleModule = require(serverTriggeredModals.SduiV2.PromptStyle)
local usePromptEntriesModule = require(serverTriggeredModals.SduiV2.usePromptEntries)
local useModalSignalStoreModule = require(serverTriggeredModals.SignalStores.useModalSignalStore)

return reactModule.memo(function(p1)
	-- upvalues: useModalSignalStoreModule (ref), reactModule (ref), usePromptEntriesModule (ref), promptStyleModule (ref), reportPromptImpressionModule (ref), loggerModule (ref), sendModalImpressionEvent (ref), sduiFeatureEntryPoint (ref)
	local surfaceConfig = p1.surfaceConfig
	local hasShownKey = p1.hasShownKey
	local var1 = useModalSignalStoreModule()
	local var2, var3 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var1 (ref), hasShownKey (ref), var3 (ref)
		if not var2 and var1.tryClaimPrimaryHandler(hasShownKey) then
			var3(true)
		end
		return function()
			-- upvalues: var2 (copy), var1 (copy), hasShownKey (copy)
			if var2 then
				var1.releasePrimaryHandler(hasShownKey)
			end
		end
	end, { var2, hasShownKey, var1 })
	local var4 = usePromptEntriesModule(surfaceConfig.configKey, promptStyleModule.Coachmark)
	local var5 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), var4 (ref)
		if not var2 then
			return ""
		end
		local t = {}
		
		for i, v in var4 do
			if v.identifier and v.title and v.config then
				table.insert(t, `{v.identifier}:{v.title}`)
			end
		end
		return table.concat(t, "|")
	end, { var2, var4 })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var4 (ref), reportPromptImpressionModule (copy), loggerModule (copy), sendModalImpressionEvent (copy)
		if var5 == "" then return end
		for i, v in var4 do
			if v.identifier and v.title and v.config then
				reportPromptImpressionModule(v.title, v.identifier):catch(function()
					-- upvalues: loggerModule (copy)
					loggerModule:warning("Failed to report coachmark prompt impression")
				end)
				sendModalImpressionEvent(v.identifier, v.title)
			end
		end
	end, { var5 })
	
	if not var2 then
		return nil
	end
	local t = {}
	
	for i, v in var4 do
		if v.config ~= nil and v.identifier ~= nil and v.title ~= nil then
			t[v.identifier] = reactModule.createElement(sduiFeatureEntryPoint, {
				shouldDisplayLoading = false,
				shouldDisplayError = false,
				configKey = surfaceConfig.configKey,
				identifier = v.identifier,
				appPage = surfaceConfig.appPage
			})
		end
	end
	return reactModule.createElement(reactModule.Fragment, nil, t)
end)