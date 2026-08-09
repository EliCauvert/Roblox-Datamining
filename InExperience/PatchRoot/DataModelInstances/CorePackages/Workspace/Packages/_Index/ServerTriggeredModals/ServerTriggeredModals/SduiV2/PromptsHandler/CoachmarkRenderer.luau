local serverTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local parent = serverTriggeredModals.Parent
local reactModule = require(parent.React)
local sduiFeatureEntryPoint = require(parent.SduiSharedUtilities).SduiFeatureEntryPoint
local loggerModule = require(serverTriggeredModals.Logger)
local reportPromptImpressionModule = require(serverTriggeredModals.reportPromptImpression)
local sendModalImpressionEventModule = require(serverTriggeredModals.sendModalImpressionEvent)
local promptStyleModule = require(serverTriggeredModals.SduiV2.PromptStyle)
local usePromptEntriesModule = require(serverTriggeredModals.SduiV2.usePromptEntries)
local useModalSignalStoreModule = require(serverTriggeredModals.SignalStores.useModalSignalStore)

return reactModule.memo(function(p0) --[[ line: 38 | named "CoachmarkRenderer" ]]
	-- upvalues: useModalSignalStoreModule (ref), reactModule (ref), usePromptEntriesModule (ref), promptStyleModule (ref), reportPromptImpressionModule (ref), loggerModule (ref), sendModalImpressionEventModule (ref), sduiFeatureEntryPoint (ref)
	local surfaceConfig = p0.surfaceConfig
	local hasShownKey = p0.hasShownKey
	local var8 = useModalSignalStoreModule()
	local var9, var10 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 44 ]]
		-- upvalues: var9 (ref), var8 (ref), hasShownKey (ref), var10 (ref)
		if not var9 and var8.tryClaimPrimaryHandler(hasShownKey) then
			var10(true)
		end
		return function() --[[ line: 48 ]]
			-- upvalues: var9 (copy), var8 (copy), hasShownKey (copy)
			if var9 then
				var8.releasePrimaryHandler(hasShownKey)
			end
		end
	end, { var9, hasShownKey, var8 })
	local var11 = usePromptEntriesModule(surfaceConfig.configKey, promptStyleModule.Coachmark)
	local var12 = reactModule.useMemo(function() --[[ line: 57 ]]
		-- upvalues: var9 (ref), var11 (ref)
		if not var9 then
			return ""
		end
		local t = {}
		
		for i, v in var11 do
			if v.identifier and v.title and v.config then
				table.insert(t, `{v.identifier}:{v.title}`)
			end
		end
		return table.concat(t, "|")
	end, { var9, var11 })
	reactModule.useEffect(function() --[[ line: 72 ]]
		-- upvalues: var12 (ref), var11 (ref), reportPromptImpressionModule (copy), loggerModule (copy), sendModalImpressionEventModule (copy)
		if var12 == "" then return end
		for i, v in var11 do
			if v.identifier and v.title and v.config then
				reportPromptImpressionModule(v.title, v.identifier):catch(function() --[[ line: 78 ]]
					-- upvalues: loggerModule (copy)
					loggerModule:warning("Failed to report coachmark prompt impression")
				end)
				sendModalImpressionEventModule(v.identifier, v.title)
			end
		end
	end, { var12 })
	
	if not var9 then
		return nil
	end
	local t = {}
	
	for i, v in var11 do
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