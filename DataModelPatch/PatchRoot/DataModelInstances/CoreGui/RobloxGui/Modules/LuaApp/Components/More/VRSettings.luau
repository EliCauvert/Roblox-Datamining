local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local UseEffectFunction = ReactModule.useEffect
local ConstantsModule = require(Modules.LuaApp.Constants)
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local MorePageScrollingFrameModule = require(Modules.LuaApp.Components.More.MorePageScrollingFrame)
local VRSettingsContentModule = require(Modules.LuaApp.Components.More.VRSettingsContent)

return require(Modules.LuaApp.Components.More.withMorePagePaddings)(function(p1)
	-- upvalues: UseStyleFunction (copy), UseEffectFunction (copy), ReactModule (copy), TopBarModule (copy), MorePageScrollingFrameModule (copy), ConstantsModule (copy), VRSettingsContentModule (copy)
	local BackgroundDefault = UseStyleFunction().Theme.BackgroundDefault
	UseEffectFunction(function()
		return function()
			if game:GetEngineFeature("GlobalBasicSettingsSaveStateReflection") then
				task.spawn(function()
					UserSettings():SaveState()
				end)
			end
		end
	end)
	local Paddings = p1.paddings
	assert(Paddings, "paddings must not be nil")
	local PaddingHorizontal = Paddings.paddingHorizontal
	local PaddingVertical = Paddings.paddingVertical
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = BackgroundDefault.Color,
		BackgroundTransparency = BackgroundDefault.Transparency
	}, {
		TopBar = ReactModule.createElement(TopBarModule.Container, { leftItem = TopBarModule.BackButton }),
		PageContent = ReactModule.createElement(TopBarModule.PageContent, {}, {
			Scroller = ReactModule.createElement(MorePageScrollingFrameModule, {
				Position = UDim2.fromScale(0, 0),
				Size = UDim2.fromScale(1, 1),
				maxWidth = Paddings.contentMaxWidth
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, ConstantsModule.MORE_PAGE_SECTION_PADDING)
				}),
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, PaddingHorizontal),
					PaddingRight = UDim.new(0, PaddingHorizontal),
					PaddingTop = UDim.new(0, PaddingVertical),
					PaddingBottom = UDim.new(0, PaddingVertical)
				}),
				Content = ReactModule.createElement(VRSettingsContentModule)
			})
		})
	})
end)