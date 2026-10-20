local CorePackages = game:GetService("CorePackages")
local InsertService = game:GetService("InsertService")
local RunService = game:GetService("RunService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local MorePageScrollingFrameModule = require(Modules.LuaApp.Components.More.MorePageScrollingFrame)
local RobloxClientChannel = RunService:GetRobloxClientChannel()
local CoreScriptVersion = RunService:GetCoreScriptVersion()
local Formatted = string.format("%s (%.6s)", RunService:GetRobloxVersion(), RunService.ClientGitHash)

local function VersionLabel(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	
	return if p1.headerText and p1.contentText then ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			Wraps = true,
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal
		}),
		HeaderText = ReactModule.createElement(Text, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.new(0, 0, 0, 0),
			Text = p1.headerText,
			fontStyle = UseTokensResult.Typography.BodyMedium,
			textStyle = UseTokensResult.Color.Content.Emphasis,
			TextXAlignment = Enum.TextXAlignment.Left,
			AutomaticSize = Enum.AutomaticSize.XY
		}),
		ContentText = ReactModule.createElement(Text, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 2,
			Size = UDim2.new(0, 0, 0, 0),
			Text = p1.contentText,
			fontStyle = UseTokensResult.Typography.BodyMedium,
			textStyle = UseTokensResult.Color.Content.Muted,
			TextXAlignment = Enum.TextXAlignment.Left,
			AutomaticSize = Enum.AutomaticSize.XY
		})
	}) else nil
end

local function LicenseLabel(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	
	return if p1.headerText and p1.contentText then ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical
		}),
		HeaderText = ReactModule.createElement(Text, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.new(0, 0, 0, 0),
			Text = p1.headerText,
			fontStyle = UseTokensResult.Typography.BodySmall,
			textStyle = UseTokensResult.Color.Content.Emphasis,
			TextXAlignment = Enum.TextXAlignment.Left,
			AutomaticSize = Enum.AutomaticSize.XY
		}),
		ContentText = ReactModule.createElement(Text, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			TextWrapped = true,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 0),
			Text = p1.contentText,
			fontStyle = UseTokensResult.Typography.BodySmall,
			textStyle = UseTokensResult.Color.Content.Muted,
			TextXAlignment = Enum.TextXAlignment.Left,
			AutomaticSize = Enum.AutomaticSize.Y
		})
	}) else nil
end

local function _()
	-- upvalues: InsertService (copy)
	local Success, Result = pcall(function()
		-- upvalues: InsertService (upval)
		local t = {}
		
		for _, child in pairs(InsertService:LoadLocalAsset("rbxasset://models/Licenses/Licenses.rbxm"):FindFirstChild("CoreScripts"):GetChildren()) do
			assert(string.match(child.Name, "^(%d*)-(.*)") ~= nil, "Invalid license name")
			local Parts = string.split(child.Name, "-")
			t[table.remove(Parts, 1) + 1] = {
				name = table.concat(Parts, "-"),
				text = string.gsub(child.Value, "\n*$", "")
			}
		end
		return t
	end)
	
	return Success and Result or {}
end

local function AppInformationPage(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Text (copy), InsertService (copy), LicenseLabel (copy), MorePageScrollingFrameModule (copy), VersionLabel (copy), TopBarModule (copy)
	local UseTokensResult = UseTokensFunction()
	local Paddings = p1.paddings
	assert(Paddings, "paddings must not be nil")
	local PaddingHorizontal = Paddings.paddingHorizontal
	local PaddingVertical = Paddings.paddingVertical
	local ContentMaxWidth = Paddings.contentMaxWidth
	local config = {
		Layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, UseTokensResult.Gap.Medium)
		}),
		SectionHeader = ReactModule.createElement(Text, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.new(0, 0, 0, 0),
			Text = p1.text.licenseHeader,
			Font = UseTokensResult.Typography.BodyMedium.Font,
			TextSize = UseTokensResult.Typography.BodyMedium.FontSize,
			LineHeight = UseTokensResult.Typography.BodyMedium.LineHeight,
			TextColor3 = UseTokensResult.Color.Content.Emphasis.Color3,
			TextTransparency = UseTokensResult.Color.Content.Emphasis.Transparency,
			TextXAlignment = Enum.TextXAlignment.Left,
			AutomaticSize = Enum.AutomaticSize.XY
		})
	}
	
	for i, value in ReactModule.useMemo(function()
		-- upvalues: InsertService (upval)
		local Success, Result = pcall(function()
			-- upvalues: InsertService (upval)
			local t = {}
			
			for _, child in pairs(InsertService:LoadLocalAsset("rbxasset://models/Licenses/Licenses.rbxm"):FindFirstChild("CoreScripts"):GetChildren()) do
				assert(string.match(child.Name, "^(%d*)-(.*)") ~= nil, "Invalid license name")
				local Parts = string.split(child.Name, "-")
				t[table.remove(Parts, 1) + 1] = {
					name = table.concat(Parts, "-"),
					text = string.gsub(child.Value, "\n*$", "")
				}
			end
			return t
		end)
		
		return Success and Result or {}
	end, {}) do
		table.insert(config, ReactModule.createElement(LicenseLabel, {
			headerText = value.name,
			contentText = value.text,
			layoutOrder = i + 1
		}))
	end
	return ReactModule.createElement("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = p1.backgroundStyle.Color,
		BackgroundTransparency = p1.backgroundStyle.Transparency
	}, {
		TopBar = ReactModule.createElement(TopBarModule.Container, { leftItem = TopBarModule.BackButton }),
		PageContent = ReactModule.createElement(TopBarModule.PageContent, {}, {
			PageContent = ReactModule.createElement(MorePageScrollingFrameModule, {
				Position = UDim2.fromScale(0, 0),
				Size = UDim2.fromScale(1, 1),
				maxWidth = ContentMaxWidth
			}, {
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, PaddingHorizontal),
					PaddingRight = UDim.new(0, PaddingHorizontal),
					PaddingTop = UDim.new(0, PaddingVertical),
					PaddingBottom = UDim.new(0, PaddingVertical)
				}),
				Layout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Left
				}),
				VersionInfo = ReactModule.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					Layout = ReactModule.createElement("UIListLayout", {
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						Padding = UDim.new(0, UseTokensResult.Padding.Medium)
					}),
					ClientCSVersionText = ReactModule.createElement(VersionLabel, {
						headerText = p1.text.coreScriptVersionHeader,
						contentText = p1.text.coreScriptVersion
					}),
					BuildVersionText = ReactModule.createElement(VersionLabel, {
						headerText = p1.text.buildVersionHeader,
						contentText = p1.text.buildVersion
					}),
					ClientChannelText = ReactModule.createElement(VersionLabel, {
						headerText = p1.text.channelNameHeader,
						contentText = p1.text.channelName
					})
				}),
				DividerContainer = ReactModule.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					Divider = ReactModule.createElement("Frame", {
						BorderSizePixel = 0,
						Size = UDim2.new(1, 0, 0, 1),
						BackgroundColor3 = p1.dividerStyle.Color,
						BackgroundTransparency = p1.dividerStyle.Transparency
					}),
					UIPadding = ReactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, UseTokensResult.Gap.Large),
						PaddingBottom = UDim.new(0, UseTokensResult.Gap.Medium)
					})
				}),
				LicenseInfo = ReactModule.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					AutomaticSize = Enum.AutomaticSize.XY
				}, config)
			})
		})
	})
end

return require(Modules.LuaApp.Components.More.withMorePagePaddings)(function(p2)
	-- upvalues: WithLocalizationModule (copy), CryoModule (copy), Formatted (ref), RobloxClientChannel (copy), CoreScriptVersion (copy), WithStyleFunction (copy), ReactModule (copy), AppInformationPage (copy)
	return WithLocalizationModule({
		licenseHeader = "CommonUI.Features.Label.Licensing",
		buildVersionHeader = {
			"CommonUI.Features.Label.VersionWithNumber",
			versionNumber = ""
		},
		channelNameHeader = {
			"CommonUI.Features.Label.ChannelWithChannelName",
			channelName = ""
		},
		coreScriptVersionHeader = {
			"CommonUI.Features.Label.ClientCoreScriptVersion",
			clientCoreScriptVersion = ""
		}
	})(function(p3)
		-- upvalues: CryoModule (upval), Formatted (upval), RobloxClientChannel (upval), CoreScriptVersion (upval), WithStyleFunction (upval), ReactModule (upval), AppInformationPage (upval), p2 (copy)
		local JoinResult = CryoModule.Dictionary.join(p3, {
			buildVersion = Formatted,
			channelName = RobloxClientChannel,
			coreScriptVersion = CoreScriptVersion
		})
		
		return WithStyleFunction(function(p4)
			-- upvalues: ReactModule (upval), AppInformationPage (upval), p2 (upval), JoinResult (copy)
			return ReactModule.createElement(AppInformationPage, {
				paddings = p2.paddings,
				backgroundStyle = p4.Theme.BackgroundDefault,
				dividerStyle = p4.Theme.Divider,
				text = JoinResult
			})
		end)
	end)
end)