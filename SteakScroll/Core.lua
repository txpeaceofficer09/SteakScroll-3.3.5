local f = CreateFrame("Frame")

local function EnableMouseWheel(frame, onWheel)
	frame:EnableMouseWheel(true)
	frame:SetScript("OnMouseWheel", onWheel)
end

local function VendorOnMouseWheel(self, delta)
	if not MerchantFrame:IsShown() then return end

	if delta > 0 then
		if MerchantPrevPageButton:IsEnabled() == 1 then
			MerchantPrevPageButton:Click()
		end
	else
		if MerchantNextPageButton:IsEnabled() == 1 then
			MerchantNextPageButton:Click()
		end
	end
end

local function SpellBookOnMouseWheel(self, delta)
	if not SpellBookFrame:IsShown() then return end

	if delta > 0 then
		if SpellBookPrevPageButton:IsEnabled() == 1 then
			SpellBookPrevPageButton:Click()
		end
	else
		if SpellBookNextPageButton:IsEnabled() == 1 then
			SpellBookNextPageButton:Click()
		end
	end
end

local function OnEvent(self, event, ...)
	EnableMouseWheel(MerchantFrame, VendorOnMouseWheel)
	EnableMouseWheel(SpellBookFrame, SpellBookOnMouseWheel)
end

f:RegisterEvent("PLAYER_LOGIN")

f:SetScript("OnEvent", OnEvent)
