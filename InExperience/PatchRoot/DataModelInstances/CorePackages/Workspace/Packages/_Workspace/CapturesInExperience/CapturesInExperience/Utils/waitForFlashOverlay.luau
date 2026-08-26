local constantsModule = require(script.Parent.Parent.Constants)

return function(p1)
	-- upvalues: constantsModule (ref)
	if not p1:getState()[constantsModule.RoduxKey].IsOverlayFlashActive then return end
	local currentTime = tick()
	while p1:getState()[constantsModule.RoduxKey].IsOverlayFlashActive and constantsModule.FlashTimeout >= tick() - currentTime do
		task.wait()
	end
end