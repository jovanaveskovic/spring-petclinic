package org.springframework.samples.petclinic.service;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.samples.petclinic.model.Vet;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * <p> Integration test using the 'Spring Data' profile.
 *
 * @author Michael Isvy
 * @see AbstractClinicServiceTests AbstractClinicServiceTests for more details. </p>
 */

@ContextConfiguration(locations = {"classpath:spring/business-config.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
@ActiveProfiles("spring-data-jpa")
public class ClinicServiceSpringDataJpaTests extends AbstractClinicServiceTests {

    @Test
    public void shouldFindAndSortVetsOnFirstPage() {
    	PageRequest page = new PageRequest(0, 5);
        Page<Vet> vets = this.clinicService.findAll(page);

        assertThat(vets.getTotalPages()).isEqualTo(2);
        assertThat(vets.getSize()).isEqualTo(5);
        assertThat(vets.iterator().next().getFirstName()).isEqualTo("Helen");
    }
}
