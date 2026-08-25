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

return reactModule.memo(function(p0)
	-- upvalues: useModalSignalStoreModule (ref), reactModule (ref), usePromptEntriesModule (ref), promptStyleModule (ref), reportPromptImpressionModule (ref), loggerModule (ref), sendModalImpressionEvent (ref), sduiFeatureEntryPoint (ref)
	local surfaceConfig = p0.surfaceConfig
	local hasShownKey = p0.hasShownKey
	local var7 = useModalSignalStoreModule()
	local var8, var9 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), var7 (ref), hasShownKey (ref), var9 (ref)
		if not var8 and var7.tryClaimPrimaryHandler(hasShownKey) then
			var9(true)
		end
		return function()
			-- upvalues: var8 (copy), var7 (copy), hasShownKey (copy)
			if var8 then
				var7.releasePrimaryHandler(hasShownKey)
			end
		end
	end, { var8, hasShownKey, var7 })
	local var10 = usePromptEntriesModule(surfaceConfig.configKey, promptStyleModule.Coachmark)
	local var11 = reactModule.useMemo(function()
		-- upvalues: var8 (ref), var10 (ref)
		if not var8 then
			return ""
		end
		local t = {}
		
		for i, v in var10 do
			if v.identifier and v.title and v.config then
				table.insert(t, `{v.identifier}:{v.title}`)
			end
		end
		return table.concat(t, "|")
	end, { var8, var10 })
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), var10 (ref), reportPromptImpressionModule (copy), loggerModule (copy), sendModalImpressionEvent (copy)
		if var11 == "" then return end
		for i, v in var10 do
			if v.identifier and v.title and v.config then
				reportPromptImpressionModule(v.title, v.identifier):catch(function()
					-- upvalues: loggerModule (copy)
					loggerModule:warning("Failed to report coachmark prompt impression")
				end)
				sendModalImpressionEvent(v.identifier, v.title)
			end
		end
	end, { var11 })
	
	if not var8 then
		return nil
	end
	local t = {}
	
	for i, v in var10 do
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