# Assertion Plan — AXI4-Lite Slave

**DUT:** `axi4_lite_slave_real.sv`
**Assertion Module:** `tb/assertions/axi4l_assertions.sv`
**Spec Reference:** `AXI4-Lite_Master-Slave_IP_updated.pdf`
**Methodology:** SVA (SystemVerilog Assertions) — concurrent properties
**Author:** Ranjithraviraj

---

## Summary

| Category | Total Assertions | Status |
|---|---|---|
| Reset Behavior | 2 | _[PASS/FAIL]_ |
| Write Address Channel | 2 | _[PASS/FAIL]_ |
| Write Data Channel | 3 | _[PASS/FAIL]_ |
| Write Response Channel | 2 | _[PASS/FAIL]_ |
| Read Address Channel | 2 | _[PASS/FAIL]_ |
| Read Data Channel | 3 | _[PASS/FAIL]_ |
| **Total** | **14** | |

---

## 1. Reset Behavior

| ID | Property Name | Description | Spec Ref | Trigger Condition | Expected Behavior | Error Message | Status |
|---|---|---|---|---|---|---|---|
| SVA-001 | `p_reset_bvalid` | BVALID must deassert after reset | Sec 21 | `!ARESETn` | `BVALID == 0` on next clock | `BVALID must be low after ARESETn drops` | _[PASS/FAIL]_ |
| SVA-002 | `p_reset_rvalid` | RVALID must deassert after reset | Sec 21 | `!ARESETn` | `RVALID == 0` on next clock | `RVALID must be low after ARESETn drops` | _[PASS/FAIL]_ |

**Note:** Both assertions use `|=>` (next-cycle implication). Reset is active-low (`!ARESETn`). No `disable iff` — these fire unconditionally during reset, which is the intended behavior.

---

## 2. Write Address Channel (AW)

| ID | Property Name | Description | Spec Ref | Trigger Condition | Expected Behavior | Error Message | Status |
|---|---|---|---|---|---|---|---|
| SVA-003 | `p_awvalid_stable` | AWVALID must not deassert before AWREADY | AXI4-Lite protocol rule | `AWVALID && !AWREADY` | `AWVALID` remains high next cycle | `AWVALID dropped without AWREADY` | _[PASS/FAIL]_ |
| SVA-004 | `p_awaddr_stable` | AWADDR must not change while AWVALID high and AWREADY low | AXI4-Lite protocol rule | `AWVALID && !AWREADY` | `AWADDR` unchanged next cycle (`$stable`) | `AWADDR changed while AWVALID high and AWREADY low` | _[PASS/FAIL]_ |

---

## 3. Write Data Channel (W)

| ID | Property Name | Description | Spec Ref | Trigger Condition | Expected Behavior | Error Message | Status |
|---|---|---|---|---|---|---|---|
| SVA-005 | `p_wvalid_stable` | WVALID must not deassert before WREADY | AXI4-Lite protocol rule | `WVALID && !WREADY` | `WVALID` remains high next cycle | `WVALID dropped without WREADY` | _[PASS/FAIL]_ |
| SVA-006 | `p_wdata_stable` | WDATA must not change while WVALID high and WREADY low | AXI4-Lite protocol rule | `WVALID && !WREADY` | `WDATA` unchanged next cycle (`$stable`) | `WDATA changed while WVALID high and WREADY low` | _[PASS/FAIL]_ |
| SVA-007 | `p_wstrb_stable` | WSTRB must not change while WVALID high and WREADY low | AXI4-Lite protocol rule, Sec 17 | `WVALID && !WREADY` | `WSTRB` unchanged next cycle (`$stable`) | `WSTRB changed while WVALID high and WREADY low` | _[PASS/FAIL]_ |

---

## 4. Write Response Channel (B)

| ID | Property Name | Description | Spec Ref | Trigger Condition | Expected Behavior | Error Message | Status |
|---|---|---|---|---|---|---|---|
| SVA-008 | `p_bvalid_stable` | BVALID must not deassert before BREADY | AXI4-Lite protocol rule | `BVALID && !BREADY` | `BVALID` remains high next cycle | `BVALID dropped without BREADY` | _[PASS/FAIL]_ |
| SVA-009 | `p_bresp_stable` | BRESP must not change while BVALID high and BREADY low | AXI4-Lite protocol rule | `BVALID && !BREADY` | `BRESP` unchanged next cycle (`$stable`) | `BRESP changed while BVALID high and BREADY low` | _[PASS/FAIL]_ |

---

## 5. Read Address Channel (AR)

| ID | Property Name | Description | Spec Ref | Trigger Condition | Expected Behavior | Error Message | Status |
|---|---|---|---|---|---|---|---|
| SVA-010 | `p_arvalid_stable` | ARVALID must not deassert before ARREADY | AXI4-Lite protocol rule | `ARVALID && !ARREADY` | `ARVALID` remains high next cycle | `ARVALID dropped without ARREADY` | _[PASS/FAIL]_ |
| SVA-011 | `p_araddr_stable` | ARADDR must not change while ARVALID high and ARREADY low | AXI4-Lite protocol rule | `ARVALID && !ARREADY` | `ARADDR` unchanged next cycle (`$stable`) | `ARADDR changed while ARVALID high and ARREADY low` | _[PASS/FAIL]_ |

---

## 6. Read Data Channel (R)

| ID | Property Name | Description | Spec Ref | Trigger Condition | Expected Behavior | Error Message | Status |
|---|---|---|---|---|---|---|---|
| SVA-012 | `p_rvalid_stable` | RVALID must not deassert before RREADY | AXI4-Lite protocol rule | `RVALID && !RREADY` | `RVALID` remains high next cycle | `RVALID dropped without RREADY` | _[PASS/FAIL]_ |
| SVA-013 | `p_rdata_stable` | RDATA must not change while RVALID high and RREADY low | AXI4-Lite protocol rule | `RVALID && !RREADY` | `RDATA` unchanged next cycle (`$stable`) | `RDATA changed while RVALID high and RREADY low` | _[PASS/FAIL]_ |
| SVA-014 | `p_rresp_stable` | RRESP must not change while RVALID high and RREADY low | AXI4-Lite protocol rule | `RVALID && !RREADY` | `RRESP` unchanged next cycle (`$stable`) | `RRESP changed while RVALID high and RREADY low` | _[PASS/FAIL]_ |

---

## Assertion Design Notes

- All channel-level assertions use `disable iff (!ARESETn)` — they are suppressed during reset, which is correct since reset clears all VALID signals anyway (SVA-001/002 cover the reset case explicitly)
- Implication operator `|=>` (non-overlapping) used throughout — check fires on the cycle **after** the trigger, matching AXI's registered behavior
- `$stable(signal)` checks that the signal value is unchanged between consecutive clock edges — correct for AXI data/address stability requirements
- Module `axi4_lite_sva` is instantiated and bound at the interface level in `tb/interfaces/axi4l_if.sv`

---

## Future Assertions (Not Yet Implemented)

| ID | Description | Priority |
|---|---|---|
| SVA-015 | BVALID must eventually assert after write address + data handshake complete (liveness) | Medium |
| SVA-016 | RVALID must eventually assert after read address handshake complete (liveness) | Medium |
| SVA-017 | No X/Z on BRESP when BVALID is high | High |
| SVA-018 | No X/Z on RRESP when RVALID is high | High |
| SVA-019 | No X/Z on RDATA when RVALID is high | High |
| SVA-020 | AWREADY deasserts after handshake (single-transaction assumption per spec Sec 19) | Low |
