local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("AvatarExperienceDebugSections").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseStoreFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useStore
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local list = { "888000001", "888000002", "888000003" }
local Formatted = string.format("https://apis.%s/__mod_harness__", require(script.Parent.getBaseDomain)())
local config = {
	checking = "Detecting proxy...",
	connected = "Proxy detected (moderation-harness active)",
	unreachable = "Proxy not detected — run `git lua proxy up` with marketplace.moderation-harness enabled in proxy-scripts.json.",
	no_addon = "Proxy running but moderation-harness addon not loaded — enable marketplace.moderation-harness in proxy-scripts.json."
}
local _Color3 = Color3.fromRGB(80, 200, 120)
local _Color3_1 = Color3.fromRGB(220, 90, 90)
local _Color3_2 = Color3.fromRGB(230, 180, 60)

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
			print(string.format("[ModerationHarness] proxy sync: %s", Joined))
			
			return
		else
			warn(string.format("[ModerationHarness] proxy sync failed for %s: %s", Joined, (tostring(Result))))
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
		return "unreachable", nil
	end
	local Success1, Result1 = pcall(function()
		-- upvalues: HttpService (upval), Result (copy)
		return HttpService:JSONDecode(Result)
	end)
	
	if Success1 and type(Result1) == "table" and Result1.ok == true then
		return "connected", Result1.harnessEnabled == true
	else
		return "no_addon", nil
	end
end

local function HarnessButton(p2)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), FoundationModule (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local IsDisabled = p2.disabled == true
	
	return ReactModule.createElement(View, {
		Size = UDim2.new(1, 0, 0, 28),
		LayoutOrder = p2.layoutOrder,
		backgroundStyle = {
			Color3 = UseTokensResult.Color.Surface.Surface_300.Color3,
			Transparency = if IsDisabled then 0.5 else 0
		},
		cornerRadius = UDim.new(0, UseTokensResult.Radius.Small),
		padding = Vector2.new(UseTokensResult.Padding.Small, 0),
		onActivated = if IsDisabled then nil else p2.onClick,
		stateLayer = if IsDisabled then nil else { mode = FoundationModule.Enums.StateLayerMode.Inverse }
	}, {
		Label = ReactModule.createElement(Text, {
			tag = "text-label-small text-align-x-left",
			Size = UDim2.new(1, 0, 1, 0),
			TextColor3 = if IsDisabled then UseTokensResult.Color.Content.Muted.Color3 else p2.accent or UseTokensResult.Color.Content.Emphasis.Color3,
			Text = p2.text
		})
	})
end

local function dumpAvatarEditorState(p2)
	-- upvalues: list (copy)
	local State = p2:getState()
	local AvatarEditor = State.AvatarExperience and State.AvatarExperience.AvatarEditor
	
	if not AvatarEditor then
		warn("[ModerationHarness] AvatarExperience.AvatarEditor state not found")
		
		return
	end
	local OwnedItemIdsBySubtype = AvatarEditor.Character and AvatarEditor.Character.OwnedItemIdsBySubtype or {}
	local OutfitInfos = AvatarEditor.OutfitInfos or {}
	local PageFinished = AvatarEditor.PageFinished or {}
	warn("=== [ModerationHarness] Store Dump ===")
	warn("-- OwnedItemIdsBySubtype keys --")
	
	for i, value in OwnedItemIdsBySubtype do
		local Count: number = if type(value) == "table" then #value else 0
		local List = {}
		
		if type(value) == "table" then
			for _, value1 in value do
				for _, value2 in list do
					if tostring(value1) == value2 then
						table.insert(List, value2)
					end
				end
			end
		end
		warn(string.format("  [%s] = %d items%s", tostring(i), Count, if #List > 0 then string.format(" ** MOCK IDS FOUND: %s **", table.concat(List, ", ")) else ""))
	end
	warn("-- OutfitInfos for mock IDs --")
	
	for _, value3 in list do
		local OutfitInfo = OutfitInfos[value3]
		
		if OutfitInfo then
			warn(string.format("  [%s] = { name=%s, outfitType=%s, availabilityStatus=%s }", value3, tostring(OutfitInfo.name), tostring(OutfitInfo.outfitType), (tostring(OutfitInfo.availabilityStatus))))
		else
			warn(string.format("  [%s] = nil (not stored)", value3))
		end
	end
	warn("-- PageFinished keys --")
	
	for i1, value4 in PageFinished do
		warn(string.format("  [%s] = %s", tostring(i1), (tostring(value4))))
	end
	warn("=== End Store Dump ===")
end

local function injectMockOutfitsIntoEditableCharacter(p3)
	-- upvalues: list (copy)
	local State = p3:getState()
	local AvatarEditor = State.AvatarExperience and State.AvatarExperience.AvatarEditor
	
	if not AvatarEditor then
		warn("[ModerationHarness] AvatarExperience.AvatarEditor state not found — cannot inject")
		
		return
	end
	local t = {}
	
	for _, value in (AvatarEditor.Character and AvatarEditor.Character.OwnedItemIdsBySubtype or {}).EditableCharacter or {} do
		t[tostring(value)] = true
	end
	local List = {}
	
	for _, value1 in list do
		if not t[value1] then
			table.insert(List, value1)
		end
	end
	if #List == 0 then
		warn("[ModerationHarness] All mock IDs already in EditableCharacter — nothing to inject")
		
		return
	else
		p3:dispatch({
			type = "SetOwnedItemIdsBySubtype",
			itemSubType = "EditableCharacter",
			itemIds = List
		})
		warn(string.format("[ModerationHarness] Injected %d mock outfit IDs into OwnedItemIdsBySubtype[%s]: %s", #List, "EditableCharacter", table.concat(List, ", ")))
	end
end

return require(Parent.DebugPanel).registerSection({
	id = "ax.moderationHarness",
	order = 150,
	defaultCollapsed = true,
	path = { "Economy", "Marketplace", "Moderation Harness" },
	component = function()
		-- upvalues: ReactModule (copy), UseStoreFunction (copy), probeProxyStatus (copy), Formatted (copy), HttpRbxApiService (copy), dumpAvatarEditorState (copy), injectMockOutfitsIntoEditableCharacter (copy), _Color3 (copy), _Color3_1 (copy), _Color3_2 (copy), Text (copy), config (copy), HarnessButton (copy)
		local Checking, Checking2 = ReactModule.useState("checking")
		local UseStateResult, UseStateResult2 = ReactModule.useState(false)
		local UseStoreResult = UseStoreFunction()
		ReactModule.useEffect(function()
			-- upvalues: probeProxyStatus (upval), Checking2 (copy), UseStateResult2 (copy)
			task.spawn(function()
				-- upvalues: probeProxyStatus (upval), Checking2 (upval), UseStateResult2 (upval)
				local ProbeProxyStatusResult, ProbeProxyStatusResult2 = probeProxyStatus()
				Checking2(ProbeProxyStatusResult)
				
				if ProbeProxyStatusResult2 ~= nil then
					UseStateResult2(ProbeProxyStatusResult2)
				end
			end)
		end, {})
		
		return ReactModule.createElement(ReactModule.Fragment, nil, {
			ProxyStatus = ReactModule.createElement(Text, {
				tag = "text-caption-small text-align-x-left",
				LayoutOrder = 1,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = config[Checking] or "",
				TextColor3 = if Checking == "connected" then _Color3 elseif Checking == "unreachable" then _Color3_1 elseif Checking == "no_addon" then _Color3_2 else nil
			}),
			HarnessEnableButton = ReactModule.createElement(HarnessButton, {
				layoutOrder = 2,
				text = if UseStateResult then "Disconnect from proxy" else "Connect to proxy",
				accent = if UseStateResult then _Color3 else nil,
				disabled = Checking ~= "connected",
				onClick = ReactModule.useCallback(function()
					-- upvalues: UseStateResult (copy), UseStateResult2 (copy), Formatted (upval), HttpRbxApiService (upval)
					local NoUseStateResult = not UseStateResult
					UseStateResult2(NoUseStateResult)
					local config = { enabled = tostring(NoUseStateResult) }
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
							print(string.format("[ModerationHarness] proxy sync: %s", Joined))
							
							return
						else
							warn(string.format("[ModerationHarness] proxy sync failed for %s: %s", Joined, (tostring(Result))))
						end
					end)
				end, { UseStateResult })
			}),
			Status = if UseStateResult then ReactModule.createElement(Text, {
				tag = "text-caption-small text-align-x-left content-muted",
				LayoutOrder = 3,
				Text = "Harness active — a fake moderated item will appear at the top of your inventory.",
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}) else nil,
			InjectMockOutfitsButton = ReactModule.createElement(HarnessButton, {
				layoutOrder = 10,
				text = "Inject Mock Outfits into Saved Avatars",
				accent = _Color3_2,
				onClick = ReactModule.useCallback(function()
					-- upvalues: injectMockOutfitsIntoEditableCharacter (upval), UseStoreResult (copy)
					injectMockOutfitsIntoEditableCharacter(UseStoreResult)
				end, { UseStoreResult })
			}),
			DumpStateButton = ReactModule.createElement(HarnessButton, {
				layoutOrder = 11,
				text = "Dump Store State (Output)",
				onClick = ReactModule.useCallback(function()
					-- upvalues: dumpAvatarEditorState (upval), UseStoreResult (copy)
					dumpAvatarEditorState(UseStoreResult)
				end, { UseStoreResult })
			})
		})
	end
})