local var11
local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local guiService = game:GetService("GuiService")
local roactModule = require(corePackagesService.Packages.Roact)
local reactModule = require(corePackagesService.Packages.React)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local tenFootInterfaceModule = require(coreGuiService:WaitForChild("RobloxGui").Modules.TenFootInterface)
local fFlagPlayerListReduceRerendersModule = require(script.Parent.Parent.Parent.Flags.FFlagPlayerListReduceRerenders)
local fFlagEnableMobilePlayerListOnConsole = playerListModule.Flags.FFlagEnableMobilePlayerListOnConsole
local var10 = nil

if game:DefineFastFlag("PlayerListTopStatCheckGamepad", false) then
	var11 = userInputService.PreferredInput == Enum.PreferredInput.Gamepad
	var11 = nil
else
	var11 = true
end
if if fFlagEnableMobilePlayerListOnConsole then guiService.ViewportDisplaySize == Enum.DisplaySize.Large and var11 else tenFootInterfaceModule:IsEnabled() then
	var10 = tenFootInterfaceModule:SetupTopStat()
end
local topStatConnector = roactModule.PureComponent:extend("TopStatConnector")

function topStatConnector.render(p0) --[[ line: 33 ]]
	-- upvalues: var10 (write)
	if var10 then
		var10:SetTopStatEnabled(p0.props.displayOptions.playerlistCoreGuiEnabled)
	end
	return nil
end

local function mapStateToProps(p1) --[[ line: 40 ]]
	return { displayOptions = p1.displayOptions }
end

return if fFlagPlayerListReduceRerendersModule then reactModule.memo(roactRoduxModule.connect(mapStateToProps, nil)(topStatConnector)) else roactRoduxModule.connect(mapStateToProps, nil)(topStatConnector)