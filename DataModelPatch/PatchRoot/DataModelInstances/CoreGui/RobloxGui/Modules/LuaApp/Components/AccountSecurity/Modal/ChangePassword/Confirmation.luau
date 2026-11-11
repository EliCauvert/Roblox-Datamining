local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local LockModule = require(Modules.LuaApp.Components.AccountSecurity.Common.Lock)
local ModalBaseModule = require(Modules.LuaApp.Components.AccountSecurity.Common.ModalBase)
local ModalBodyTextModule = require(Modules.LuaApp.Components.AccountSecurity.Common.ModalBodyText)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local config = {
	description = "Feature.AccountSecurityPrompt.Description.ChangeYourPasswordSuccess",
	header = "Feature.AccountSecurityPrompt.Header.Success"
}
local ExtendResult = RoactModule.PureComponent:extend("ChangePassword" .. script.Name)

function ExtendResult:render()
	-- upvalues: WithLocalizationModule (copy), config (copy), RoactModule (copy), ModalBaseModule (copy), LockModule (copy), ModalBodyTextModule (copy)
	return WithLocalizationModule(config)(function(p1)
		-- upvalues: RoactModule (upval), ModalBaseModule (upval), LockModule (upval), ModalBodyTextModule (upval)
		return RoactModule.createElement(ModalBaseModule, {
			title = p1.header,
			makeBodyFragment = function(ContentWidth)
				-- upvalues: RoactModule (upval), LockModule (upval), ModalBodyTextModule (upval), p1 (copy)
				return RoactModule.createFragment({
					Lock = RoactModule.createElement(LockModule, { layoutOrder = 1 }),
					ModalBodyText = RoactModule.createElement(ModalBodyTextModule, {
						layoutOrder = 2,
						contentWidth = ContentWidth,
						text = p1.description
					})
				})
			end
		})
	end)
end

return ExtendResult