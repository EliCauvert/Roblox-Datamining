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
local var12 = nil

if not fFlagPlayerListRemoveTopStatModule then
	local var13
	if playerListTopStatCheckGamepad then
		var13 = userInputService.PreferredInput == Enum.PreferredInput.Gamepad
		var13 = nil
	else
		var13 = true
	end
	if if fFlagEnableMobilePlayerListOnConsole then guiService.ViewportDisplaySize == Enum.DisplaySize.Large and var13 else tenFootInterfaceModule:IsEnabled() then
		var12 = tenFootInterfaceModule:SetupTopStat()
	end
end
local topStatConnector = roactModule.PureComponent:extend("TopStatConnector")

function topStatConnector.render(p0) --[[ line: 36 ]]
	-- upvalues: var12 (write)
	if var12 then
		var12:SetTopStatEnabled(p0.props.displayOptions.playerlistCoreGuiEnabled)
	end
	return nil
end

local function mapStateToProps(p1) --[[ line: 43 ]]
	return { displayOptions = p1.displayOptions }
end

return if fFlagPlayerListReduceRerendersModule then reactModule.memo(roactRoduxModule.connect(mapStateToProps, nil)(topStatConnector)) else roactRoduxModule.connect(mapStateToProps, nil)(topStatConnector)