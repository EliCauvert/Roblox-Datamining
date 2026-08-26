local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local guiService = game:GetService("GuiService")
local roactModule = require(corePackagesService.Packages.Roact)
local reactModule = require(corePackagesService.Packages.React)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local tenFootInterfaceModule = require(coreGuiService:WaitForChild("RobloxGui").Modules.TenFootInterface)
local parent = script.Parent.Parent.Parent
local fFlagPlayerListReduceRerendersModule = require(parent.Flags.FFlagPlayerListReduceRerenders)
local fFlagPlayerListRemoveTopStatModule = require(parent.Flags.FFlagPlayerListRemoveTopStat)
local fFlagEnableMobilePlayerListOnConsole = playerListModule.Flags.FFlagEnableMobilePlayerListOnConsole
local playerListTopStatCheckGamepad = game:DefineFastFlag("PlayerListTopStatCheckGamepad", false)
local var1 = nil

if not fFlagPlayerListRemoveTopStatModule then
	local var2
	if playerListTopStatCheckGamepad then
		var2 = userInputService.PreferredInput == Enum.PreferredInput.Gamepad
		var2 = nil
	else
		var2 = true
	end
	if if fFlagEnableMobilePlayerListOnConsole then guiService.ViewportDisplaySize == Enum.DisplaySize.Large and var2 else tenFootInterfaceModule:IsEnabled() then
		var1 = tenFootInterfaceModule:SetupTopStat()
	end
end
local topStatConnector = roactModule.PureComponent:extend("TopStatConnector")

function topStatConnector.render(p1)
	-- upvalues: var1 (write)
	if var1 then
		var1:SetTopStatEnabled(p1.props.displayOptions.playerlistCoreGuiEnabled)
	end
	return nil
end

local function mapStateToProps(p1)
	return { displayOptions = p1.displayOptions }
end

return if fFlagPlayerListReduceRerendersModule then reactModule.memo(roactRoduxModule.connect(mapStateToProps, nil)(topStatConnector)) else roactRoduxModule.connect(mapStateToProps, nil)(topStatConnector)