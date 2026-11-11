local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local TModule = require(CorePackages.Packages.t)
local InterfaceResult = TModule.interface({ bundleId = TModule.number, userOutfitId = TModule.number })
local SignUpBundleModule = {
	new = function()
		return { bundleId = "", userOutfitId = "" }
	end
}

function SignUpBundleModule.mock()
	-- upvalues: SignUpBundleModule (copy)
	local NewSignUpBundle = SignUpBundleModule.new()
	NewSignUpBundle.bundleId = "23452"
	NewSignUpBundle.userOutfitId = "65234"
	
	return NewSignUpBundle
end

function SignUpBundleModule.fromData(p1)
	-- upvalues: SignUpBundleModule (copy), InterfaceResult (copy), ArgCheckModule (copy)
	local NewSignUpBundle = SignUpBundleModule.new()
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult(p1)
	
	if InterfaceResultResult then
		NewSignUpBundle.bundleId = tostring(p1.bundleId)
		NewSignUpBundle.userOutfitId = tostring(p1.userOutfitId)
		
		return NewSignUpBundle
	else
		ArgCheckModule.assert(false, InterfaceResultResult2)
		
		return NewSignUpBundle
	end
end

return SignUpBundleModule