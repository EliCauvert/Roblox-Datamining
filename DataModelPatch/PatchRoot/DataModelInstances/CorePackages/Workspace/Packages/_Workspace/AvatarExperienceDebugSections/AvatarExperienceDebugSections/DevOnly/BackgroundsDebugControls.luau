local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("AvatarExperienceDebugSections").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local _Color3 = Color3.fromRGB(80, 200, 120)
local _Color3_1 = Color3.fromRGB(220, 90, 90)
local _Color3_2 = Color3.fromRGB(230, 180, 60)
local _Color3_3 = Color3.fromRGB(100, 160, 255)
local Formatted = string.format("https://apis.%s/__bg_harness__", require(script.Parent.getBaseDomain)())
local list = { "populated", "empty", "error", "passthrough" }
local config = {
	checking = "Checking proxy...",
	connected = "Proxy connected (backgrounds-harness active)",
	unreachable = "Proxy not detected — run `git lua proxy up` with marketplace.backgrounds-harness enabled in proxy-scripts.json.",
	no_addon = "Proxy running but backgrounds-harness addon not loaded — enable marketplace.backgrounds-harness in proxy-scripts.json."
}

local function probeProxyStatus()
	-- upvalues: HttpRbxApiService (copy), Formatted (copy), HttpService (copy)
	local Success, Result = pcall(function()
		-- upvalues: HttpRbxApiService (upval), Formatted (upval)
		return HttpRbxApiService:GetAsyncFullUrl(Formatted, Enum.ThrottlingPriority.Default)
	end)
	
	if not Success then
		warn("[BackgroundsHarness] probe failed:", (tostring(Result)))
		
		return "unreachable", nil, nil
	end
	local Success1, Result1 = pcall(function()
		-- upvalues: HttpService (upval), Result (copy)
		return HttpService:JSONDecode(Result)
	end)
	
	if Success1 and type(Result1) == "table" and Result1.ok == true then
		return "connected", Result1.backgroundsMode, Result1.harnessEnabled == true
	else
		return "no_addon", nil, nil
	end
end

local function _(p1)
	-- upvalues: Formatted (copy), HttpRbxApiService (copy)
	task.spawn(function()
		-- upvalues: Formatted (upval), p1 (copy), HttpRbxApiService (upval)
		local Formatted = string.format("%s?mode=%s", Formatted, p1)
		local Success, Result = pcall(function()
			-- upvalues: HttpRbxApiService (upval), Formatted (copy)
			HttpRbxApiService:GetAsyncFullUrl(Formatted, Enum.ThrottlingPriority.Default)
		end)
		
		if Success then
			print(string.format("[BackgroundsHarness] proxy sync: mode=%s", p1))
			
			return
		else
			warn(string.format("[BackgroundsHarness] proxy sync failed for mode=%s: %s", p1, (tostring(Result))))
		end
	end)
end

local _ = function(p1)
	-- upvalues: Formatted (copy), HttpRbxApiService (copy)
	task.spawn(function()
		-- upvalues: Formatted (upval), p1 (copy), HttpRbxApiService (upval)
		local Formatted = string.format("%s?enabled=%s", Formatted, (tostring(p1)))
		local Success, Result = pcall(function()
			-- upvalues: HttpRbxApiService (upval), Formatted (copy)
			HttpRbxApiService:GetAsyncFullUrl(Formatted, Enum.ThrottlingPriority.Default)
		end)
		
		if Success then
			print(string.format("[BackgroundsHarness] proxy sync: enabled=%s", (tostring(p1))))
			
			return
		else
			warn(string.format("[BackgroundsHarness] proxy sync failed for enabled=%s: %s", tostring(p1), (tostring(Result))))
		end
	end)
end

local function StatusRow(p1)
	-- upvalues: ReactModule (copy), View (copy), Text (copy), _Color3 (copy), _Color3_1 (copy)
	return ReactModule.createElement(View, {
		ClipsDescendants = true,
		Size = UDim2.new(1, 0, 0, 20),
		LayoutOrder = p1.layoutOrder
	}, {
		Label = ReactModule.createElement(Text, {
			tag = "text-caption-small text-align-x-left content-muted",
			Size = UDim2.new(0.45, 0, 1, 0),
			TextTruncate = Enum.TextTruncate.AtEnd,
			Text = p1.label
		}),
		Value = ReactModule.createElement(Text, {
			tag = "text-caption-small text-align-x-left",
			Size = UDim2.new(0.55, 0, 1, 0),
			Position = UDim2.new(0.45, 0, 0, 0),
			TextTruncate = Enum.TextTruncate.AtEnd,
			Text = p1.value,
			TextColor3 = if p1.ok then _Color3 else _Color3_1
		})
	})
end

local function ModeButton(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), FoundationModule (copy), Text (copy), _Color3_3 (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		Size = UDim2.new(1, 0, 0, 28),
		LayoutOrder = p1.layoutOrder,
		backgroundStyle = {
			Transparency = 0,
			Color3 = UseTokensResult.Color.Surface.Surface_300.Color3
		},
		cornerRadius = UDim.new(0, UseTokensResult.Radius.Small),
		padding = Vector2.new(UseTokensResult.Padding.Small, 0),
		onActivated = p1.onClick,
		stateLayer = { mode = FoundationModule.Enums.StateLayerMode.Inverse }
	}, {
		Label = ReactModule.createElement(Text, {
			tag = "text-label-small text-align-x-left",
			Size = UDim2.new(1, 0, 1, 0),
			TextColor3 = if p1.isActive then _Color3_3 else UseTokensResult.Color.Content.Emphasis.Color3,
			Text = if p1.isActive then p1.text .. "  (active)" else p1.text
		})
	})
end

return require(Parent.DebugPanel).registerSection({
	id = "ax.backgroundsDebug",
	order = 200,
	path = { "Economy", "Marketplace", "Backgrounds" },
	component = function()
		-- upvalues: AvatarExperienceFlagsModule (copy), AvatarExperienceCommonModule (copy), ReactModule (copy), probeProxyStatus (copy), Formatted (copy), HttpRbxApiService (copy), _Color3 (copy), _Color3_1 (copy), _Color3_2 (copy), StatusRow (copy), View (copy), Text (copy), config (copy), ModeButton (copy), list (copy)
		local FFlagAXBackgroundsRoot = AvatarExperienceFlagsModule.FFlagAXBackgroundsRoot
		local FFlagAXCatalogBackgroundsSupport = AvatarExperienceFlagsModule.FFlagAXCatalogBackgroundsSupport
		local AvatarBackground = AvatarExperienceCommonModule.Constants.ASSET_TYPE_NAME_TO_ID_STRING.AvatarBackground
		local HasAvatarBackground = AvatarBackground ~= nil
		local Success = pcall(function()
			-- upvalues: AvatarExperienceCommonModule (upval)
			return AvatarExperienceCommonModule.Enums.CatalogCategories.Backgrounds
		end)
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
		local UseResult = ReactModule.useCallback(function()
			-- upvalues: UseStateResult1 (copy), UseStateResult2_1 (copy), Formatted (upval), HttpRbxApiService (upval)
			local NoUseStateResult1 = not UseStateResult1
			UseStateResult2_1(NoUseStateResult1)
			task.spawn(function()
				-- upvalues: Formatted (upval), NoUseStateResult1 (copy), HttpRbxApiService (upval)
				local Formatted = string.format("%s?enabled=%s", Formatted, (tostring(NoUseStateResult1)))
				local Success, Result = pcall(function()
					-- upvalues: HttpRbxApiService (upval), Formatted (copy)
					HttpRbxApiService:GetAsyncFullUrl(Formatted, Enum.ThrottlingPriority.Default)
				end)
				
				if Success then
					print(string.format("[BackgroundsHarness] proxy sync: enabled=%s", (tostring(NoUseStateResult1))))
					
					return
				else
					warn(string.format("[BackgroundsHarness] proxy sync failed for enabled=%s: %s", tostring(NoUseStateResult1), (tostring(Result))))
				end
			end)
		end, { UseStateResult1 })
		local UseResult1 = ReactModule.useCallback(function(p1)
			-- upvalues: Formatted (upval), HttpRbxApiService (upval), UseStateResult2 (copy)
			return function()
				-- upvalues: p1 (copy), Formatted (upval), HttpRbxApiService (upval), UseStateResult2 (upval)
				task.spawn(function()
					-- upvalues: Formatted (upval), p1 (copy), HttpRbxApiService (upval)
					local Formatted = string.format("%s?mode=%s", Formatted, p1)
					local Success, Result = pcall(function()
						-- upvalues: HttpRbxApiService (upval), Formatted (copy)
						HttpRbxApiService:GetAsyncFullUrl(Formatted, Enum.ThrottlingPriority.Default)
					end)
					
					if Success then
						print(string.format("[BackgroundsHarness] proxy sync: mode=%s", p1))
						
						return
					else
						warn(string.format("[BackgroundsHarness] proxy sync failed for mode=%s: %s", p1, (tostring(Result))))
					end
				end)
				UseStateResult2(p1)
			end
		end, {})
		local config1 = {
			EngineEnum = ReactModule.createElement(StatusRow, {
				label = "Engine enum",
				value = "Available",
				ok = true,
				layoutOrder = 1
			}),
			FlagRoot = ReactModule.createElement(StatusRow, {
				label = "FFlagAXBackgroundsRoot",
				layoutOrder = 2,
				value = if FFlagAXBackgroundsRoot then "ON" else "OFF",
				ok = FFlagAXBackgroundsRoot
			}),
			FlagSupport = ReactModule.createElement(StatusRow, {
				label = "FFlagAXCatalogBackgroundsSupport",
				layoutOrder = 3,
				value = if FFlagAXCatalogBackgroundsSupport then "ON" else "OFF",
				ok = FFlagAXCatalogBackgroundsSupport
			}),
			AssetTypeId = ReactModule.createElement(StatusRow, {
				label = "Asset type ID",
				layoutOrder = 4,
				value = if HasAvatarBackground then tostring(AvatarBackground) else "nil (flag off)",
				ok = HasAvatarBackground
			}),
			CategoryEnum = ReactModule.createElement(StatusRow, {
				label = "CatalogCategories.Backgrounds",
				layoutOrder = 5,
				value = if Success then "Registered" else "nil (flag off)",
				ok = Success
			}),
			Divider = ReactModule.createElement(View, { LayoutOrder = 10, Size = UDim2.new(1, 0, 0, 8) }),
			ProxyStatus = ReactModule.createElement(Text, {
				tag = "text-caption-small text-align-x-left",
				LayoutOrder = 11,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = config[Checking] or "",
				TextColor3 = if Checking == "connected" then _Color3 elseif Checking == "unreachable" then _Color3_1 elseif Checking == "no_addon" then _Color3_2 else nil
			})
		}
		
		if Checking == "connected" then
			config1.HarnessEnableButton = ReactModule.createElement(ModeButton, {
				layoutOrder = 12,
				text = if UseStateResult1 then "Disconnect from proxy" else "Connect to proxy",
				isActive = UseStateResult1,
				onClick = UseResult
			})
			
			if UseStateResult1 then
				config1.ModeLabel = ReactModule.createElement(Text, {
					tag = "text-caption-small text-align-x-left content-muted",
					LayoutOrder = 13,
					Size = UDim2.new(1, 0, 0, 20),
					Text = string.format("Current mode: %s", UseStateResult or "unknown")
				})
				
				for i, Text1 in list do
					config1["Mode_" .. Text1] = ReactModule.createElement(ModeButton, {
						text = Text1,
						isActive = UseStateResult == Text1,
						onClick = UseResult1(Text1),
						layoutOrder = 20 + i
					})
				end
			end
		end
		return ReactModule.createElement(ReactModule.Fragment, nil, config1)
	end
})