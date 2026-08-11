local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local signalsReactModule = require(parent_1.SignalsReact)
local displayModule = require(parent_1.Display)
local cryoModule = require(parent_1.Cryo)
local foundationModule = require(parent_1.Foundation)
local useScaledValue = foundationModule.Hooks.useScaledValue
local useTokens = foundationModule.Hooks.useTokens
local layoutValuesContextModule = require(script.Parent.LayoutValuesContext)
local fFlagEnableMobilePlayerListOnConsoleModule = require(parent.Flags.FFlagEnableMobilePlayerListOnConsole)
local fFlagPlayerListDropDownShowPlatformNameModule = require(parent.Flags.FFlagPlayerListDropDownShowPlatformName)

return function() --[[ line: 21 | named "useLayoutValues" ]]
	-- upvalues: reactModule (ref), layoutValuesContextModule (ref), useTokens (ref), fFlagEnableMobilePlayerListOnConsoleModule (ref), useScaledValue (ref), signalsReactModule (ref), displayModule (ref), fFlagPlayerListDropDownShowPlatformNameModule (ref), cryoModule (ref)
	local var8 = reactModule.useContext(layoutValuesContextModule)
	local var9 = useTokens()
	local var10 = if fFlagEnableMobilePlayerListOnConsoleModule then useScaledValue(var8.PlayerDropDownSizeX * 10) / 10 else nil
	local var11 = if fFlagEnableMobilePlayerListOnConsoleModule then useScaledValue((var8.EntryBaseSizeX or 150) * 10) / 10 else nil
	local var12 = if fFlagEnableMobilePlayerListOnConsoleModule then useScaledValue(var8.PlayerDropDownSizeXMobile * 10) / 10 else nil
	local var13 = if fFlagEnableMobilePlayerListOnConsoleModule then useScaledValue(var8.PlayerNameSizeXMobile * 10) / 10 else nil
	local var14 = if fFlagEnableMobilePlayerListOnConsoleModule then useScaledValue(500) else nil
	local var15 = if fFlagEnableMobilePlayerListOnConsoleModule then useScaledValue(600) else nil
	local var16 = if not fFlagEnableMobilePlayerListOnConsoleModule then signalsReactModule.useSignalState((if not fFlagEnableMobilePlayerListOnConsoleModule then signalsReactModule.useSignalState(displayModule.GetDisplayStore) else nil).getUIScale) else nil
	local size100 = var9.Size.Size_100
	
	return cryoModule.Dictionary.join(var8, {
		PlayerListSizeMin = var14,
		PlayerListSizeMax = var15,
		ContainerPadding = size100,
		ContainerPosition = UDim2.new(1, -size100, 0, size100),
		ExtraContainerPadding = var9.Size.Size_400,
		PlayerDropDownSizeX = if fFlagEnableMobilePlayerListOnConsoleModule then var10 else var8.PlayerDropDownSizeX * var16,
		PlayerDropDownOffset = var9.Size.Size_100,
		EntryBaseSizeX = if var8.EntryBaseSizeX then if fFlagEnableMobilePlayerListOnConsoleModule then var11 else var8.EntryBaseSizeX * var16 else nil,
		EntrySizeIncreasePerStat = var9.Size.Size_300,
		PlayerEntrySizeY = var9.Size.Size_1000,
		TeamEntrySizeY = var9.Size.Size_600,
		TeamNameTextSize = if fFlagEnableMobilePlayerListOnConsoleModule then var9.FontSize.FontSize_300 else nil,
		StatEntrySizeX = var9.Size.Size_1600,
		TitleBarTextSize = if fFlagEnableMobilePlayerListOnConsoleModule then var9.FontSize.FontSize_250 else nil,
		TitleBarSizeY = var9.Size.Size_500,
		PlayerIconSize = UDim2.new(0, var9.Size.Size_400, 0, var9.Size.Size_400),
		InitalPlayerEntryPadding = var9.Size.Size_300,
		PlayerEntryPadding = var9.Size.Size_300,
		PlayerEntryNamePadding = var9.Size.Size_100,
		StatTextPadding = var9.Size.Size_100,
		PlayerNameSize = UDim2.new(1, -var9.Size.Size_900, 1, 0),
		PlayerNameTextSize = var9.FontSize.FontSize_300,
		StatTextSize = var9.FontSize.FontSize_300,
		ScrollBarOffset = var9.Size.Size_100,
		ScrollBarSize = var9.Size.Size_200,
		PlayerDropDownSizeXMobile = if fFlagEnableMobilePlayerListOnConsoleModule then var12 else var8.PlayerDropDownSizeXMobile * var16,
		ScrollBarSizeMobile = var9.Size.Size_50,
		PlayerNameSizeXMobile = if fFlagEnableMobilePlayerListOnConsoleModule then var13 else var8.PlayerNameSizeXMobile * var16,
		PlayerIconSizeMobile = UDim2.fromOffset(var9.Size.Size_500, var9.Size.Size_500),
		PlayerNameTextSizeMobile = var9.FontSize.FontSize_350,
		StatTextSizeMobile = var9.FontSize.FontSize_350,
		PlayerNamePaddingXMobile = var9.Size.Size_350,
		TeamEntryTextPadding = var9.Size.Size_400,
		TeamEntryTextPaddingMobile = var9.Size.Size_350,
		PlayerIconBackgroundSize = UDim2.new(0, 66, 0, 66),
		DropDownButtonSizeY = var9.Size.Size_1400,
		DropDownButtonTextSize = if fFlagEnableMobilePlayerListOnConsoleModule then var9.FontSize.FontSize_400 else nil,
		DropDownPadding = var9.Size.Size_250,
		DropDownRightOptionSize = var9.Size.Size_1400,
		DropDownIconSize = var9.Size.Size_900,
		DropDownHeaderSizeY = var9.Size.Size_2000,
		DropDownHeaderBackgroundSize = if fFlagPlayerListDropDownShowPlatformNameModule then var9.Size.Size_1800 else var9.Size.Size_1600,
		DropDownHeaderDisplayNameTextSize = if fFlagEnableMobilePlayerListOnConsoleModule then var9.FontSize.FontSize_400 else nil,
		DropDownHeaderPlayerNameTextSize = if fFlagEnableMobilePlayerListOnConsoleModule then var9.FontSize.FontSize_300 else nil,
		DropDownScreenSidePadding = size100,
		PlayerScrollListSizeTwoTabsOnLegacy = UDim2.new(1, 0, 1, -var9.Size.Size_1100)
	})
end