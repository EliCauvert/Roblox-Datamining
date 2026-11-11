local CorePackages = game:GetService("CorePackages")
local PromiseModule = require(CorePackages.Packages.Promise)
local Default = require(CorePackages.Workspace.Packages.CredentialsProtocol).CredentialsProtocol.default
local KeystoreConstants = require(CorePackages.Workspace.Packages.AuthCommon).Common.KeystoreConstants

return function(p1)
	-- upvalues: Default (copy), KeystoreConstants (copy), PromiseModule (copy)
	return Default:isAvailable(Default.CredentialsTypes.keystore, KeystoreConstants.KeystoreTimeout):andThen(function(Result)
		-- upvalues: Default (upval), p1 (copy), KeystoreConstants (upval), PromiseModule (upval)
		return if Result and Result.keystore and Result.keystore.isAvailable then Default:deleteAllCredentialsFromKeystore(Default.CredentialsTypes.keystore, p1, KeystoreConstants.KeystoreTimeout) else PromiseModule.resolve(nil)
	end)
end