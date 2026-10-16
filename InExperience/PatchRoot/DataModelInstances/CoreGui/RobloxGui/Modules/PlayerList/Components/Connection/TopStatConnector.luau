local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TenFootInterfaceModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.TenFootInterface)
local Parent = script.Parent.Parent.Parent
local FFlagPlayerListReduceRerendersModule = require(Parent.Flags.FFlagPlayerListReduceRerenders)
local FFlagEnableMobilePlayerListOnConsole = require(CorePackages.Workspace.Packages.PlayerList).Flags.FFlagEnableMobilePlayerListOnConsole
local PlayerListTopStatCheckGamepad = game:DefineFastFlag("PlayerListTopStatCheckGamepad", false)
local FFlagLuaSupportMicroGamepadPreferredInput = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaSupportMicroGamepadPreferredInput
local SetupTopStatResult = nil

if not require(Parent.Flags.FFlagPlayerListRemoveTopStat) then
	local NoPlayerListTopStatCheckGamepad: boolean = not PlayerListTopStatCheckGamepad or (UserInputService.PreferredInput == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput and UserInputService.PreferredInput == Enum.PreferredInput.MicroGamepad)
	
	if if FFlagEnableMobilePlayerListOnConsole then GuiService.ViewportDisplaySize == Enum.DisplaySize.Large and NoPlayerListTopStatCheckGamepad else TenFootInterfaceModule:IsEnabled() then
		SetupTopStatResult = TenFootInterfaceModule:SetupTopStat()
	end
end
local TopStatConnector = RoactModule.PureComponent:extend("TopStatConnector")

function TopStatConnector.render(p1) --[[ Line: 44 ]]
	-- upvalues: SetupTopStatResult (ref)
	if SetupTopStatResult then
		SetupTopStatResult:SetTopStatEnabled(p1.props.displayOptions.playerlistCoreGuiEnabled)
	end
	return nil
end

local function mapStateToProps(p1) --[[ Line: 51 ]]
	return { displayOptions = p1.displayOptions }
end

return if FFlagPlayerListReduceRerendersModule then ReactModule.memo(RoactRoduxModule.connect(mapStateToProps, nil)(TopStatConnector)) else RoactRoduxModule.connect(mapStateToProps, nil)(TopStatConnector)