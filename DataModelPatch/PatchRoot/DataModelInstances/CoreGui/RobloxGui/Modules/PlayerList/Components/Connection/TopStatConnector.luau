local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TenFootInterfaceModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.TenFootInterface)
local FFlagPlayerListReduceRerendersModule = require(script.Parent.Parent.Parent.Flags.FFlagPlayerListReduceRerenders)
local FFlagEnableMobilePlayerListOnConsole = require(CorePackages.Workspace.Packages.PlayerList).Flags.FFlagEnableMobilePlayerListOnConsole
local SetupTopStatResult = nil
local Inverted: boolean = not game:DefineFastFlag("PlayerListTopStatCheckGamepad", false) or UserInputService.PreferredInput == Enum.PreferredInput.Gamepad

if if FFlagEnableMobilePlayerListOnConsole then GuiService.ViewportDisplaySize == Enum.DisplaySize.Large and Inverted else TenFootInterfaceModule:IsEnabled() then
	SetupTopStatResult = TenFootInterfaceModule:SetupTopStat()
end
local TopStatConnector = RoactModule.PureComponent:extend("TopStatConnector")

function TopStatConnector.render(p1)
	-- upvalues: SetupTopStatResult (ref)
	if SetupTopStatResult then
		SetupTopStatResult:SetTopStatEnabled(p1.props.displayOptions.playerlistCoreGuiEnabled)
	end
	return nil
end

local function mapStateToProps(p1)
	return { displayOptions = p1.displayOptions }
end

return if FFlagPlayerListReduceRerendersModule then ReactModule.memo(RoactRoduxModule.connect(mapStateToProps, nil)(TopStatConnector)) else RoactRoduxModule.connect(mapStateToProps, nil)(TopStatConnector)