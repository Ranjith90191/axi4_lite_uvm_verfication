# Verification Plan — AXI4-Lite Slave
**DUT:** `axi4_lite_slave_real.sv`
**Spec:** `AXI4-Lite_Master-Slave_IP_updated.pdf`
**Simulator:** Synopsys VCS
**Methodology:** UVM 1.2
**Author:** ranjithraviraj
**Related Documents:**
- Assertion Plan: [`docs/assertion_plan.md`](assertion_plan.md)
- Coverage Plan: [`docs/coverage_plan.md`](coverage_plan.md)
- Architecture: [`docs/architecture.md`](architecture.md)
- Architecture: [`docs/full_plan.xlsx`](full_plan.xlsx)
---
## Verification Closure Criteria

| Metric | Target | Achieved |
| :--- | :--- | :--- |
| Functional Coverage | 100% | ✅ 100% |
| Code Coverage | ≥ 80% | 94.03% |
| All directed tests passing | 100% | _85.71%_ |
| All SVA assertions passing | 0 failures | _100%_ |
| Regression passing | 100% | _85.71%_ |

---
## Feature Verification Traceability
### 1. Write Transactions

| Feature | Spec Ref | Sequence | Covergroup | Status |
| :--- | :--- | :--- | :--- | :--- |
| Basic write to R/W register | Sec 10, 11 | `axi4l_write_seq`, `axi4l_normal_rw_seq` | addr_region_cg: RW | **PASS** |
| Write address handshake (AWVALID/AWREADY) | Sec 4, 11 | All write sequences | — | **FAIL** |
| Write data handshake (WVALID/WREADY) | Sec 5, 11 | All write sequences | — | **PASS** |
| Write response (BVALID/BREADY) | Sec 6, 11 | All write sequences | bresp_cg: OKAY | **PASS** |
| Write to Read-Only region → SLVERR | Sec 20 | `axi4l_ro_test_seq` | bresp_cg: SLVERR | **PASS** |
| Write to Write-Only region → OKAY | Sec 10, 20 | `axi4l_wo_test_seq` | addr_region_cg: WO | **PASS** |
| Write to out-of-range address → DECERR | Sec 9, 20 | `axi4l_decerr_seq` | bresp_cg: DECERR | **FAIL** |
| Unaligned write address → SLVERR | Sec 10, 20 | `axi4l_unaligned_seq` | bresp_cg: SLVERR | **FAIL** |
| Byte-enable (WSTRB) partial write | Sec 17 | `axi4l_fully_rand` | wstrb_cg | **PASS** |
| Address and data may arrive in any order | Sec 11 | `axi4l_concurrent_seq` | txn_type_cg | **FAIL** |

### 2. Read Transactions

| Feature | Spec Ref | Sequence | Covergroup | Status |
| :--- | :--- | :--- | :--- | :--- |
| Basic read from R/W register | Sec 10, 12 | `axi4l_read_seq`, `axi4l_normal_rw_seq` | addr_region_cg: RW | **PASS** |
| Read address handshake (ARVALID/ARREADY) | Sec 7, 12 | All read sequences | — | **PASS** |
| Read data response (RVALID/RREADY) | Sec 8, 12 | All read sequences | rresp_cg: OKAY | **PASS** |
| Read from Read-Only region → OKAY + correct data | Sec 10 | `axi4l_ro_test_seq` | addr_region_cg: RO | **PASS** |
| Read from Write-Only region → SLVERR | Sec 20 | `axi4l_wo_test_seq` | rresp_cg: SLVERR | **PASS** |
| Read from out-of-range address → DECERR | Sec 9, 20 | `axi4l_decerr_seq` | rresp_cg: DECERR | **PASS** |
| Unaligned read address → SLVERR | Sec 10, 20 | `axi4l_unaligned_seq` | rresp_cg: SLVERR | **PASS** |
| Read data correctness (readback after write) | Sec 10 | `axi4l_normal_rw_seq` | — | **FAIL** |

### 3. Concurrent / Parallel Operation

| Feature | Spec Ref | Sequence | Covergroup | Status |
| :--- | :--- | :--- | :--- | :--- |
| Simultaneous read and write transaction | Sec 18 | `axi4l_concurrent_seq` | txn_type_cg: concurrent | **PASS** |
| Read and write FSMs operate independently | Sec 18 | `axi4l_concurrent_seq`, `axi4l_fully_rand` | — | **PASS** |

### 4. Protocol / Handshake Compliance

| Feature | Spec Ref | Assertion | Status |
| :--- | :--- | :--- | :--- |
| AWVALID stable until AWREADY | AXI spec rule | `assert_awvalid_stable` | **PASS** |
| WVALID stable until WREADY | AXI spec rule | `assert_wvalid_stable` | **PASS** |
| ARVALID stable until ARREADY | AXI spec rule | `assert_arvalid_stable` | **PASS** |
| BVALID follows completed write | Sec 11 | `assert_bvalid_after_write` | **PASS** |
| No X on BRESP/RRESP when VALID high | — | `assert_no_x_on_resp` | **PASS** |

### 5. Reset Behavior

| Feature | Status |
| :--- | :--- |
| All VALID signals cleared on ARESETn | **PASS** |
| FSMs return to IDLE on reset | **PASS** |
| Internal registers zeroed on reset | **PASS** |

### 6. Register Map Boundary Conditions

| Feature | Address | Sequence | Status |
| :--- | :--- | :--- | :--- |
| First valid register (0x00) | 0x00 | `axi4l_normal_rw_seq` | **PASS** |
| Last R/W register (0x24) | 0x24 | `axi4l_normal_rw_seq` | **PASS** |
| First RO register (0x28) | 0x28 | `axi4l_ro_test_seq` | **PASS** |
| Last RO register (0x30) | 0x30 | `axi4l_ro_test_seq` | **PASS** |
| First WO register (0x34) | 0x34 | `axi4l_wo_test_seq` | **PASS** |
| Last WO register (0x38) | 0x38 | `axi4l_wo_test_seq` | **PASS** |
| Reserved register (0x3C) | 0x3C | `axi4l_normal_rw_seq` | **PASS** |
| First invalid address (0x40) | 0x40 | `axi4l_decerr_seq` | **FAIL** (Writes) |

---
