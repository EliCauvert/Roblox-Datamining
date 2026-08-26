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

return function()
	-- upvalues: reactModule (ref), layoutValuesContextModule (ref), useTokens (ref), fFlagEnableMobilePlayerListOnConsoleModule (ref), useScaledValue (ref), signalsReactModule (ref), displayModule (ref), fFlagPlayerListDropDownShowPlatformNameModule (ref), cryoModule (ref)
	local var1 = reactModule.useContext(layoutValuesContextModule)
	local var2 = useTokens()
	local var3 = if fFlagEnableMobilePlayerListOnConsoleModule then useScaledValue(var1.PlayerDropDownSizeX * 10) / 10 else nil
	local var4 = if fFlagEnableMobilePlayerListOnConsoleModule then useScaledValue((var1.EntryBaseSizeX or 150) * 10) / 10 else nil
	local var5 = if fFlagEnableMobilePlayerListOnConsoleModule then useScaledValue(var1.PlayerDropDownSizeXMobile * 10) / 10 else nil
	local var6 = if fFlagEnableMobilePlayerListOnConsoleModule then useScaledValue(var1.PlayerNameSizeXMobile * 10) / 10 else nil
	local var7 = if fFlagEnableMobilePlayerListOnConsoleModule then useScaledValue(500) else nil
	local var8 = if fFlagEnableMobilePlayerListOnConsoleModule then useScaledValue(600) else nil
	local var9 = if not fFlagEnableMobilePlayerListOnConsoleModule then signalsReactModule.useSignalState((if not fFlagEnableMobilePlayerListOnConsoleModule then signalsReactModule.useSignalState(displayModule.GetDisplayStore) else nil).getUIScale) else nil
	local size100 = var2.Size.Size_100
	
	return cryoModule.Dictionary.join(var1, {
		PlayerListSizeMin = var7,
		PlayerListSizeMax = var8,
		ContainerPadding = size100,
		ContainerPosition = UDim2.new(1, -size100, 0, size100),
		ExtraContainerPadding = var2.Size.Size_400,
		PlayerDropDownSizeX = if fFlagEnableMobilePlayerListOnConsoleModule then var3 else var1.PlayerDropDownSizeX * var9,
		PlayerDropDownOffset = var2.Size.Size_100,
		EntryBaseSizeX = if var1.EntryBaseSizeX then if fFlagEnableMobilePlayerListOnConsoleModule then var4 else var1.EntryBaseSizeX * var9 else nil,
		EntrySizeIncreasePerStat = var2.Size.Size_300,
		PlayerEntrySizeY = var2.Size.Size_1000,
		TeamEntrySizeY = var2.Size.Size_600,
		TeamNameTextSize = if fFlagEnableMobilePlayerListOnConsoleModule then var2.FontSize.FontSize_300 else nil,
		StatEntrySizeX = var2.Size.Size_1600,
		TitleBarTextSize = if fFlagEnableMobilePlayerListOnConsoleModule then var2.FontSize.FontSize_250 else nil,
		TitleBarSizeY = var2.Size.Size_500,
		PlayerIconSize = UDim2.new(0, var2.Size.Size_400, 0, var2.Size.Size_400),
		InitalPlayerEntryPadding = var2.Size.Size_300,
		PlayerEntryPadding = var2.Size.Size_300,
		PlayerEntryNamePadding = var2.Size.Size_100,
		StatTextPadding = var2.Size.Size_100,
		PlayerNameSize = UDim2.new(1, -var2.Size.Size_900, 1, 0),
		PlayerNameTextSize = var2.FontSize.FontSize_300,
		StatTextSize = var2.FontSize.FontSize_300,
		ScrollBarOffset = var2.Size.Size_100,
		ScrollBarSize = var2.Size.Size_200,
		PlayerDropDownSizeXMobile = if fFlagEnableMobilePlayerListOnConsoleModule then var5 else var1.PlayerDropDownSizeXMobile * var9,
		ScrollBarSizeMobile = var2.Size.Size_50,
		PlayerNameSizeXMobile = if fFlagEnableMobilePlayerListOnConsoleModule then var6 else var1.PlayerNameSizeXMobile * var9,
		PlayerIconSizeMobile = UDim2.fromOffset(var2.Size.Size_500, var2.Size.Size_500),
		PlayerNameTextSizeMobile = var2.FontSize.FontSize_350,
		StatTextSizeMobile = var2.FontSize.FontSize_350,
		PlayerNamePaddingXMobile = var2.Size.Size_350,
		TeamEntryTextPadding = var2.Size.Size_400,
		TeamEntryTextPaddingMobile = var2.Size.Size_350,
		PlayerIconBackgroundSize = UDim2.new(0, 66, 0, 66),
		DropDownButtonSizeY = var2.Size.Size_1400,
		DropDownButtonTextSize = if fFlagEnableMobilePlayerListOnConsoleModule then var2.FontSize.FontSize_400 else nil,
		DropDownPadding = var2.Size.Size_250,
		DropDownRightOptionSize = var2.Size.Size_1400,
		DropDownIconSize = var2.Size.Size_900,
		DropDownHeaderSizeY = var2.Size.Size_2000,
		DropDownHeaderBackgroundSize = if fFlagPlayerListDropDownShowPlatformNameModule then var2.Size.Size_1800 else var2.Size.Size_1600,
		DropDownHeaderDisplayNameTextSize = if fFlagEnableMobilePlayerListOnConsoleModule then var2.FontSize.FontSize_400 else nil,
		DropDownHeaderPlayerNameTextSize = if fFlagEnableMobilePlayerListOnConsoleModule then var2.FontSize.FontSize_300 else nil,
		DropDownScreenSidePadding = size100,
		PlayerScrollListSizeTwoTabsOnLegacy = UDim2.new(1, 0, 1, -var2.Size.Size_1100)
	})
end