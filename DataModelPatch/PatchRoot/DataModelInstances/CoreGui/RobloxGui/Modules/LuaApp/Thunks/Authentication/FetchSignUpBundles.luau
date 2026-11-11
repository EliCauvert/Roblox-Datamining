local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local TModule = require(CorePackages.Packages.t)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local PromiseModule = require(CorePackages.Packages.Promise)
local RetryModule = require(Modules.LuaApp.Thunks.Networking.Util.Retry)
local SignUpBundleModule = require(Modules.LuaApp.Models.Authentication.SignUpBundle)
local SetSignUpBundlesModule = require(Modules.LuaApp.Actions.Authentication.SetSignUpBundles)
local GetSignUpBundlesModule = require(Modules.LuaApp.Http.Requests.GetSignUpBundles)
local FetchHumanoidDescriptionPropertiesModule = require(Modules.LuaApp.Thunks.Authentication.FetchHumanoidDescriptionProperties)
local FFlagRemoveUnusedSignUpInfoRoduxSlice = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRemoveUnusedSignUpInfoRoduxSlice
local Largest = math.max(0, require(Modules.LuaApp.Flags.GetFIntLuaSignUpMaxRetries)())
local Largest1 = math.max(0, require(Modules.LuaApp.Flags.GetFIntLuaSignUpRetryTimeMultiplier)())
local ArrayResult = TModule.array(TModule.optional(TModule.interface({ bundleId = TModule.number, userOutfitId = TModule.number })))
local FetchSignUpBundlesModule = {
	_fetchSignUpBundles = function(p1)
		-- upvalues: GetSignUpBundlesModule (copy), ArrayResult (copy), PromiseModule (copy)
		return GetSignUpBundlesModule(p1):andThen(function(Result)
			-- upvalues: ArrayResult (upval), PromiseModule (upval)
			local Bundles = Result and (Result.responseBody and Result.responseBody.bundles)
			
			return if ArrayResult(Bundles) then PromiseModule.resolve(Bundles) else PromiseModule.resolve()
		end)
	end
}

function FetchSignUpBundlesModule._fetchSignUpBundlesWithRetry(p1)
	-- upvalues: FetchSignUpBundlesModule (copy), RetryModule (copy), Largest (copy), Largest1 (copy)
	local function fetchSignUpBundles()
		-- upvalues: FetchSignUpBundlesModule (upval), p1 (copy)
		return FetchSignUpBundlesModule._fetchSignUpBundles(p1)
	end
	
	return FetchSignUpBundlesModule._fetchSignUpBundles(p1):andThen(function(Result)
		-- upvalues: RetryModule (upval), Largest (upval), Largest1 (upval), fetchSignUpBundles (copy)
		return RetryModule({
			retryCount = Largest,
			retryTimeMultiplier = Largest1,
			retryCallback = fetchSignUpBundles,
			previousResult = Result,
			isResolveConditionMet = function(p2): boolean
				return p2 ~= nil
			end
		})
	end)
end

function FetchSignUpBundlesModule.Fetch(p1)
	-- upvalues: PerformFetch (copy), FetchSignUpBundlesModule (copy), ArrayResult (copy), SignUpBundleModule (copy), FFlagRemoveUnusedSignUpInfoRoduxSlice (copy), SetSignUpBundlesModule (copy), PromiseModule (copy), FetchHumanoidDescriptionPropertiesModule (copy)
	return PerformFetch.Single("signUpBundles", function(p2)
		-- upvalues: FetchSignUpBundlesModule (upval), p1 (copy), ArrayResult (upval), SignUpBundleModule (upval), FFlagRemoveUnusedSignUpInfoRoduxSlice (upval), SetSignUpBundlesModule (upval), PromiseModule (upval), FetchHumanoidDescriptionPropertiesModule (upval)
		return FetchSignUpBundlesModule._fetchSignUpBundlesWithRetry(p1):andThen(function(Result)
			-- upvalues: ArrayResult (upval), SignUpBundleModule (upval), FFlagRemoveUnusedSignUpInfoRoduxSlice (upval), p2 (copy), SetSignUpBundlesModule (upval), PromiseModule (upval)
			local FromDataResults = {}
			
			if not ArrayResult(Result) then
				return PromiseModule.reject()
			end
			for _, value in ipairs(Result) do
				table.insert(FromDataResults, SignUpBundleModule.fromData(value))
			end
			if not FFlagRemoveUnusedSignUpInfoRoduxSlice then
				p2:dispatch(SetSignUpBundlesModule(FromDataResults))
			end
			return PromiseModule.resolve(FromDataResults)
		end):andThen(function(Result)
			-- upvalues: p2 (copy), FetchHumanoidDescriptionPropertiesModule (upval), p1 (upval)
			local List = {}
			
			for _, value in pairs(Result) do
				table.insert(List, value.userOutfitId)
			end
			return p2:dispatch(FetchHumanoidDescriptionPropertiesModule.Fetch(p1, List))
		end)
	end)
end

function FetchSignUpBundlesModule.GetFetchingStatus(p3)
	-- upvalues: PerformFetch (copy)
	return PerformFetch.GetStatus(p3, "signUpBundles")
end

return FetchSignUpBundlesModule