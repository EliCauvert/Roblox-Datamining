local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(Modules.LuaApp.Promise)
local GetVerifiedEmailModule = require(Modules.LuaApp.Http.Requests.GetVerifiedEmail)
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)
local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)

return function(p1, p2, p3)
	-- upvalues: GetVerifiedEmailModule (copy), PromiseModule (copy), CryoModule (copy), SetCentralOverlayModule (copy), OverlayTypeModule (copy)
	return function(p4)
		-- upvalues: GetVerifiedEmailModule (upval), p1 (copy), p2 (copy), PromiseModule (upval), p3 (copy), CryoModule (upval), SetCentralOverlayModule (upval), OverlayTypeModule (upval)
		return GetVerifiedEmailModule(p1):andThen(function(Result)
			-- upvalues: p2 (upval), PromiseModule (upval), p3 (upval), CryoModule (upval), p4 (copy), SetCentralOverlayModule (upval), OverlayTypeModule (upval)
			local EmailAddress = Result.responseBody.emailAddress
			local IsNotEmailAddressMatch: boolean = EmailAddress and EmailAddress ~= ""
			local Verified = Result.responseBody.verified
			
			if p2 then
				Verified = Verified or IsNotEmailAddressMatch
			end
			if Verified then
				return PromiseModule.resolve({ EmailAddress = EmailAddress })
			end
			local JoinResult = { emailAddress = EmailAddress }
			
			if p3 then
				JoinResult = CryoModule.Dictionary.join(JoinResult, p3)
			end
			p4:dispatch(SetCentralOverlayModule(OverlayTypeModule.EmailVerificationUpsellOverlay, JoinResult))
			
			return PromiseModule.reject()
		end, function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve()
		end)
	end
end