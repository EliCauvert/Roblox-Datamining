local HttpService = game:GetService("HttpService")
local UrlBuilderModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.UrlBuilder)
local _ = require(game:GetService("CorePackages").Workspace.Packages.Http)

return function(Callback, Upsell_platform, User_robux_balance, Attempt_robux_amount, Item_product_id, Item_name, Universe_id)
	-- upvalues: UrlBuilderModule (copy), HttpService (copy)
	return Callback(UrlBuilderModule.economy.paymentsGateway.getUpsellProduct(), "POST", {
		postBody = HttpService:JSONEncode({
			upsell_platform = Upsell_platform,
			user_robux_balance = User_robux_balance,
			attempt_robux_amount = Attempt_robux_amount,
			item_product_id = Item_product_id,
			item_name = Item_name,
			universe_id = Universe_id
		})
	})
end