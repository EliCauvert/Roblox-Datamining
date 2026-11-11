local Modules = game:GetService("CoreGui").RobloxGui.Modules
local TModule = require(game:GetService("CorePackages").Packages.t)
local DevSubStatusModule = require(Modules.LuaApp.Enum.DevSubStatus)
local DevSubPlanStatusModule = require(Modules.LuaApp.Enum.DevSubPlanStatus)
local UnionResult = TModule.union(TModule.literal(DevSubPlanStatusModule.Open), TModule.literal(DevSubPlanStatusModule.Closed), TModule.literal(DevSubPlanStatusModule.Archived))
local StrictInterfaceResult = TModule.strictInterface({
	id = TModule.number,
	universeId = TModule.number,
	imageAssetId = TModule.number,
	status = UnionResult,
	name = TModule.string,
	description = TModule.string,
	priceInRobux = TModule.number,
	renewalPeriod = TModule.literal("Monthly"),
	created = TModule.string,
	updated = TModule.string
})
local StrictInterfaceResult1 = TModule.strictInterface({ id = TModule.number, name = TModule.string })
local UnionResult1 = TModule.union(TModule.literal(DevSubStatusModule.Active), TModule.literal(DevSubStatusModule.Inactive))
local StrictInterfaceResult2 = TModule.strictInterface({
	id = TModule.string,
	planId = TModule.number,
	userId = TModule.number,
	status = UnionResult1,
	isAutoRenewing = TModule.boolean,
	startDate = TModule.string,
	expirationDate = TModule.string
})

return {
	PlanCheck = StrictInterfaceResult,
	PlanStatusCheck = UnionResult,
	UniverseCheck = StrictInterfaceResult1,
	SubscriptionCheck = StrictInterfaceResult2,
	SubscriptionStatusCheck = UnionResult1,
	SubscriptionsResponseCheck = TModule.strictInterface({
		data = TModule.array(StrictInterfaceResult2),
		auxiliaryData = TModule.strictInterface({
			plans = TModule.map(TModule.string, StrictInterfaceResult),
			universes = TModule.map(TModule.string, StrictInterfaceResult1)
		}),
		previousPageCursor = TModule.optional(TModule.string),
		nextPageCursor = TModule.optional(TModule.string)
	}),
	DevSubJsonCheck = TModule.interface({
		id = TModule.string,
		status = UnionResult1,
		isAutoRenewing = TModule.boolean,
		expirationDate = TModule.string,
		planData = StrictInterfaceResult,
		gameData = StrictInterfaceResult1
	})
}