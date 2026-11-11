local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("AvatarExperienceDebugSections").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local RoactUtilsModule = require(Parent.RoactUtils)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local RobloxSubscriptionPurchaseAppModule = require(Parent.RobloxSubscriptionPurchaseApp)
local SetUserHasRobloxSubscriptionFunction = require(Parent.UserLib).Actions.SetUserHasRobloxSubscription
local Formatted = string.format("https://apis.%s/__sub_harness__", require(script.Parent.getBaseDomain)())
local config = { type = "ClearReceivedCatalogData" }

local function _(p1)
	-- upvalues: Formatted (copy), HttpRbxApiService (copy)
	task.spawn(function()
		-- upvalues: p1 (copy), Formatted (upval), HttpRbxApiService (upval)
		local List = {}
		
		for i, value in p1 do
			table.insert(List, string.format("%s=%s", i, value))
		end
		local Formatted = if #List > 0 then string.format("%s?%s", Formatted, table.concat(List, "&")) else Formatted
		local Success, Result = pcall(function()
			-- upvalues: HttpRbxApiService (upval), Formatted (copy)
			HttpRbxApiService:GetAsyncFullUrl(Formatted, Enum.ThrottlingPriority.Default)
		end)
		local Joined = table.concat(List, " ")
		
		if Success then
			print(string.format("[SubscriptionHarness] proxy sync: %s", Joined))
			
			return
		else
			warn(string.format("[SubscriptionHarness] proxy sync failed for %s: %s", Joined, (tostring(Result))))
		end
	end)
end

local _ = function(p2)
	-- upvalues: Formatted (copy), HttpRbxApiService (copy)
	local config = { mode = tostring(p2) }
	task.spawn(function()
		-- upvalues: config (copy), Formatted (upval), HttpRbxApiService (upval)
		local List = {}
		
		for i, value in config do
			table.insert(List, string.format("%s=%s", i, value))
		end
		local Formatted = if #List > 0 then string.format("%s?%s", Formatted, table.concat(List, "&")) else Formatted
		local Success, Result = pcall(function()
			-- upvalues: HttpRbxApiService (upval), Formatted (copy)
			HttpRbxApiService:GetAsyncFullUrl(Formatted, Enum.ThrottlingPriority.Default)
		end)
		local Joined = table.concat(List, " ")
		
		if Success then
			print(string.format("[SubscriptionHarness] proxy sync: %s", Joined))
			
			return
		else
			warn(string.format("[SubscriptionHarness] proxy sync failed for %s: %s", Joined, (tostring(Result))))
		end
	end)
end

local _ = function(p3)
	-- upvalues: Formatted (copy), HttpRbxApiService (copy)
	local config = { enabled = tostring(p3) }
	task.spawn(function()
		-- upvalues: config (copy), Formatted (upval), HttpRbxApiService (upval)
		local List = {}
		
		for i, value in config do
			table.insert(List, string.format("%s=%s", i, value))
		end
		local Formatted = if #List > 0 then string.format("%s?%s", Formatted, table.concat(List, "&")) else Formatted
		local Success, Result = pcall(function()
			-- upvalues: HttpRbxApiService (upval), Formatted (copy)
			HttpRbxApiService:GetAsyncFullUrl(Formatted, Enum.ThrottlingPriority.Default)
		end)
		local Joined = table.concat(List, " ")
		
		if Success then
			print(string.format("[SubscriptionHarness] proxy sync: %s", Joined))
			
			return
		else
			warn(string.format("[SubscriptionHarness] proxy sync failed for %s: %s", Joined, (tostring(Result))))
		end
	end)
end

local function probeProxyStatus()
	-- upvalues: HttpRbxApiService (copy), Formatted (copy), HttpService (copy)
	local Success, Result = pcall(function()
		-- upvalues: HttpRbxApiService (upval), Formatted (upval)
		return HttpRbxApiService:GetAsyncFullUrl(Formatted, Enum.ThrottlingPriority.Default)
	end)
	
	if not Success then
		return "unreachable", nil, nil
	end
	local Success1, Result1 = pcall(function()
		-- upvalues: HttpService (upval), Result (copy)
		return HttpService:JSONDecode(Result)
	end)
	
	if Success1 and type(Result1) == "table" and Result1.ok == true then
		return "connected", Result1.subscriberMode == true, Result1.harnessEnabled == true
	else
		return "no_addon", nil, nil
	end
end

local config1 = {
	checking = "Detecting proxy...",
	connected = "Proxy detected",
	unreachable = "Proxy not detected — run `git lua proxy up` with marketplace.subscription-harness enabled in proxy-scripts.json.",
	no_addon = "Proxy detected, but subscription-harness addon not loaded — enable marketplace.subscription-harness in proxy-scripts.json."
}
local _Color3 = Color3.fromRGB(80, 200, 120)
local _Color3_1 = Color3.fromRGB(220, 90, 90)
local _Color3_2 = Color3.fromRGB(230, 180, 60)

local function selectLocalUserId(p4)
	return p4.LocalUserId
end

local function HarnessButton(p4)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), FoundationModule (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local IsDisabled = p4.disabled == true
	
	return ReactModule.createElement(View, {
		Size = UDim2.new(1, 0, 0, 28),
		LayoutOrder = p4.layoutOrder,
		backgroundStyle = {
			Color3 = UseTokensResult.Color.Surface.Surface_300.Color3,
			Transparency = if IsDisabled then 0.5 else 0
		},
		cornerRadius = UDim.new(0, UseTokensResult.Radius.Small),
		padding = Vector2.new(UseTokensResult.Padding.Small, 0),
		onActivated = if IsDisabled then nil else p4.onClick,
		stateLayer = if IsDisabled then nil else { mode = FoundationModule.Enums.StateLayerMode.Inverse }
	}, {
		Label = ReactModule.createElement(Text, {
			tag = "text-label-small text-align-x-left",
			Size = UDim2.new(1, 0, 1, 0),
			TextColor3 = if IsDisabled then UseTokensResult.Color.Content.Muted.Color3 else p4.accent or UseTokensResult.Color.Content.Emphasis.Color3,
			Text = p4.text
		})
	})
end

return require(Parent.DebugPanel).registerSection({
	id = "ax.subscriptionHarness",
	order = 100,
	defaultCollapsed = true,
	path = { "Economy", "Marketplace", "Subscription Harness" },
	component = function()
		-- upvalues: RobloxSubscriptionPurchaseAppModule (copy), UseSignalStateFunction (copy), UseDispatchFunction (copy), UseSelectorFunction (copy), selectLocalUserId (copy), ReactModule (copy), probeProxyStatus (copy), SetUserHasRobloxSubscriptionFunction (copy), Formatted (copy), HttpRbxApiService (copy), config (copy), _Color3 (copy), _Color3_1 (copy), _Color3_2 (copy), Text (copy), config1 (copy), HarnessButton (copy)
		local GetResult = RobloxSubscriptionPurchaseAppModule.RobloxSubscriptionSignals.get()
		local UseSignalStateResult = UseSignalStateFunction(GetResult.getHasRobloxSubscription)
		local UseSignalStateResult1 = UseSignalStateFunction(GetResult.getGainedRobloxSubscriptionThisSession)
		local UseDispatchResult = UseDispatchFunction()
		local UseSelectorResult = UseSelectorFunction(selectLocalUserId)
		local Checking, Checking2 = ReactModule.useState("checking")
		local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
		local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
		ReactModule.useEffect(function()
			-- upvalues: probeProxyStatus (upval), Checking2 (copy), UseStateResult2 (copy), UseStateResult2_1 (copy)
			task.spawn(function()
				-- upvalues: probeProxyStatus (upval), Checking2 (upval), UseStateResult2 (upval), UseStateResult2_1 (upval)
				local ProbeProxyStatusResult, ProbeProxyStatusResult2, ProbeProxyStatusResult3 = probeProxyStatus()
				Checking2(ProbeProxyStatusResult)
				UseStateResult2(ProbeProxyStatusResult2)
				
				if ProbeProxyStatusResult3 ~= nil then
					UseStateResult2_1(ProbeProxyStatusResult3)
				end
			end)
		end, {})
		local UseResult = ReactModule.useCallback(function(p4)
			-- upvalues: GetResult (copy), UseSelectorResult (copy), UseDispatchResult (copy), SetUserHasRobloxSubscriptionFunction (upval)
			GetResult.setHasRobloxSubscriptionForTesting(p4)
			
			if UseSelectorResult ~= nil then
				UseDispatchResult(SetUserHasRobloxSubscriptionFunction(UseSelectorResult, p4))
			end
		end, { GetResult, UseDispatchResult, UseSelectorResult })
		ReactModule.useEffect(function()
			-- upvalues: UseSignalStateResult (copy), Formatted (upval), HttpRbxApiService (upval), Checking (copy), UseStateResult2 (copy)
			local config = { mode = tostring(UseSignalStateResult) }
			task.spawn(function()
				-- upvalues: config (copy), Formatted (upval), HttpRbxApiService (upval)
				local List = {}
				
				for i, value in config do
					table.insert(List, string.format("%s=%s", i, value))
				end
				local Formatted = if #List > 0 then string.format("%s?%s", Formatted, table.concat(List, "&")) else Formatted
				local Success, Result = pcall(function()
					-- upvalues: HttpRbxApiService (upval), Formatted (copy)
					HttpRbxApiService:GetAsyncFullUrl(Formatted, Enum.ThrottlingPriority.Default)
				end)
				local Joined = table.concat(List, " ")
				
				if Success then
					print(string.format("[SubscriptionHarness] proxy sync: %s", Joined))
					
					return
				else
					warn(string.format("[SubscriptionHarness] proxy sync failed for %s: %s", Joined, (tostring(Result))))
				end
			end)
			
			if Checking == "connected" then
				UseStateResult2(UseSignalStateResult)
			end
		end, { UseSignalStateResult })
		local UseResult1 = ReactModule.useCallback(function()
			-- upvalues: UseResult (copy), UseSignalStateResult (copy)
			UseResult(not UseSignalStateResult)
		end, { UseResult, UseSignalStateResult })
		local UseResult2 = ReactModule.useCallback(function()
			-- upvalues: UseStateResult1 (copy), UseStateResult2_1 (copy), Formatted (upval), HttpRbxApiService (upval)
			local NoUseStateResult1 = not UseStateResult1
			UseStateResult2_1(NoUseStateResult1)
			local config = { enabled = tostring(NoUseStateResult1) }
			task.spawn(function()
				-- upvalues: config (copy), Formatted (upval), HttpRbxApiService (upval)
				local List = {}
				
				for i, value in config do
					table.insert(List, string.format("%s=%s", i, value))
				end
				local Formatted = if #List > 0 then string.format("%s?%s", Formatted, table.concat(List, "&")) else Formatted
				local Success, Result = pcall(function()
					-- upvalues: HttpRbxApiService (upval), Formatted (copy)
					HttpRbxApiService:GetAsyncFullUrl(Formatted, Enum.ThrottlingPriority.Default)
				end)
				local Joined = table.concat(List, " ")
				
				if Success then
					print(string.format("[SubscriptionHarness] proxy sync: %s", Joined))
					
					return
				else
					warn(string.format("[SubscriptionHarness] proxy sync failed for %s: %s", Joined, (tostring(Result))))
				end
			end)
		end, { UseStateResult1 })
		local UseResult3 = ReactModule.useCallback(function()
			-- upvalues: GetResult (copy)
			GetResult.setGainedRobloxSubscriptionThisSessionForTesting(true)
		end, { GetResult })
		local UseResult4 = ReactModule.useCallback(function()
			-- upvalues: UseDispatchResult (copy), config (upval)
			UseDispatchResult(config)
		end, { UseDispatchResult })
		local UseResult5 = ReactModule.useCallback(function()
			-- upvalues: GetResult (copy), UseSelectorResult (copy), UseDispatchResult (copy), SetUserHasRobloxSubscriptionFunction (upval)
			GetResult.setHasRobloxSubscriptionForTesting(false)
			GetResult.setGainedRobloxSubscriptionThisSessionForTesting(false)
			
			if UseSelectorResult ~= nil then
				UseDispatchResult(SetUserHasRobloxSubscriptionFunction(UseSelectorResult, false))
			end
		end, { GetResult, UseDispatchResult, UseSelectorResult })
		local Color = if Checking == "connected" then _Color3 elseif Checking == "unreachable" then _Color3_1 elseif Checking == "no_addon" then _Color3_2 else nil
		local List = {
			string.format("Subscription: %s", if UseSignalStateResult then "ON" else "OFF"),
			string.format("GainedThisSession: %s", if UseSignalStateResult1 then "TRUE" else "FALSE")
		}
		
		if Checking == "connected" and UseStateResult ~= nil then
			table.insert(List, string.format("Proxy mode: %s", if UseStateResult then "ON" else "OFF"))
		end
		local Joined = table.concat(List, "   ")
		
		return ReactModule.createElement(ReactModule.Fragment, nil, {
			ProxyStatus = ReactModule.createElement(Text, {
				tag = "text-caption-small text-align-x-left",
				LayoutOrder = 1,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = config1[Checking] or "",
				TextColor3 = Color
			}),
			HarnessEnableButton = ReactModule.createElement(HarnessButton, {
				layoutOrder = 2,
				text = if UseStateResult1 then "Disconnect from proxy" else "Connect to proxy",
				accent = if UseStateResult1 then _Color3 else nil,
				disabled = Checking ~= "connected",
				onClick = UseResult2
			}),
			Status = if UseStateResult1 then ReactModule.createElement(Text, {
				tag = "text-caption-small text-align-x-left content-muted",
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 0, 20),
				Text = Joined
			}) else nil,
			ToggleButton = if UseStateResult1 then ReactModule.createElement(HarnessButton, {
				layoutOrder = 4,
				text = if UseSignalStateResult then "Toggle Sub  (currently ON)" else "Toggle Sub  (currently OFF)",
				accent = if UseSignalStateResult then _Color3 else _Color3_1,
				onClick = UseResult1
			}) else nil,
			GainedButton = if UseStateResult1 then ReactModule.createElement(HarnessButton, {
				layoutOrder = 5,
				text = "Set GainedThisSession = true",
				onClick = UseResult3
			}) else nil,
			ClearButton = if UseStateResult1 then ReactModule.createElement(HarnessButton, {
				layoutOrder = 6,
				text = "Dispatch ClearReceivedCatalogData",
				onClick = UseResult4
			}) else nil,
			ResetButton = if UseStateResult1 then ReactModule.createElement(HarnessButton, {
				layoutOrder = 7,
				text = "Reset all",
				onClick = UseResult5
			}) else nil
		})
	end
})