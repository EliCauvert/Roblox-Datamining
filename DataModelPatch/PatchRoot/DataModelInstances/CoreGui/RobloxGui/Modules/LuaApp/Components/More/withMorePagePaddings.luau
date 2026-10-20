local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local ConstantsModule = require(Modules.LuaApp.Constants)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local UseBreakpointXOrLargerFunction = ResponsiveModule.useBreakpointXOrLarger
local FFlagEnableDevicePreferenceLayoutUpdateModule = require(Modules.LuaApp.Flags.FFlagEnableDevicePreferenceLayoutUpdate)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens

local function _(p1)
	-- upvalues: UseBreakpointXOrLargerFunction (copy), ResponsiveModule (copy), FFlagEnableDevicePreferenceLayoutUpdateModule (copy), ConstantsModule (copy)
	local UseBreakpointXOrLargerResult = UseBreakpointXOrLargerFunction(ResponsiveModule.Keys.Small)
	
	if FFlagEnableDevicePreferenceLayoutUpdateModule then
		return p1.Size.Size_500, p1.Size.Size_600
	elseif UseBreakpointXOrLargerResult then
		return ConstantsModule.MORE_PAGE_WIDE_PADDING_HORIZONTAL, ConstantsModule.MORE_PAGE_WIDE_PADDING_VERTICAL
	else
		return ConstantsModule.MORE_PAGE_COMPACT_PADDING_HORIZONTAL, ConstantsModule.MORE_PAGE_SECTION_PADDING
	end
end

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), UseBreakpointXOrLargerFunction (copy), ResponsiveModule (copy), FFlagEnableDevicePreferenceLayoutUpdateModule (copy), ConstantsModule (copy), ReactModule (copy), CryoModule (copy)
	return function(p2)
		-- upvalues: UseDesignTokensFunction (upval), UseBreakpointXOrLargerFunction (upval), ResponsiveModule (upval), FFlagEnableDevicePreferenceLayoutUpdateModule (upval), ConstantsModule (upval), ReactModule (upval), p1 (copy), CryoModule (upval)
		local UseDesignTokensResult = UseDesignTokensFunction()
		local UseBreakpointXOrLargerResult = UseBreakpointXOrLargerFunction(ResponsiveModule.Keys.Small)
		local Size500 = nil
		local Size600 = nil
		
		if FFlagEnableDevicePreferenceLayoutUpdateModule then
			Size500 = UseDesignTokensResult.Size.Size_500
			Size600 = UseDesignTokensResult.Size.Size_600
		elseif UseBreakpointXOrLargerResult then
			Size500 = ConstantsModule.MORE_PAGE_WIDE_PADDING_HORIZONTAL
			Size600 = ConstantsModule.MORE_PAGE_WIDE_PADDING_VERTICAL
		else
			Size500 = ConstantsModule.MORE_PAGE_COMPACT_PADDING_HORIZONTAL
			Size600 = ConstantsModule.MORE_PAGE_SECTION_PADDING
		end
		return ReactModule.createElement(p1, CryoModule.Dictionary.join(p2, {
			paddings = {
				paddingHorizontal = Size500,
				paddingVertical = Size600,
				contentMaxWidth = ConstantsModule.MORE_PAGE_CONTENT_MAX_WIDTH + Size500 * 2
			}
		}))
	end
end