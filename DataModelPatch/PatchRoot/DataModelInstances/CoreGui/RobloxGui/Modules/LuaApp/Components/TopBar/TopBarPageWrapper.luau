local ReactModule = require(game:GetService("CorePackages").Packages.React)
local TopBarPageContentModule = require(script.Parent.TopBarPageContent)
local TopBarContentFrameModule = require(script.Parent.TopBarContentFrame)

return function(Tbl)
	-- upvalues: ReactModule (copy), TopBarPageContentModule (copy), TopBarContentFrameModule (copy)
	local TopBarSlot = Tbl.topBarSlot
	local Copy = table.clone(Tbl)
	Copy.topBarSlot = nil
	
	return if TopBarSlot then ReactModule.createElement(ReactModule.Fragment, nil, {
		TopBar = TopBarSlot,
		TopBarPageContent = ReactModule.createElement(TopBarPageContentModule, Copy)
	}) else ReactModule.createElement(TopBarContentFrameModule, Copy)
end